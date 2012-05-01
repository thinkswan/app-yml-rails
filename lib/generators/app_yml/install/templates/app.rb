# Public: Extends Ruby's Hash class to provide a method for performing a deep update on a hash.
class Hash
  # Public: Performs an in-place deep update on the calling hash with the provided 'new_hash'. Allows us to override 'app.yml'
  # settings from the 'all' environment with the current environment (test/development/staging/production) with unlimited nesting.
  #
  # new_hash - The hash to copy over the calling hash.
  #
  # Examples
  #
  #   { :email => 'email@example.com', :name => 'Graham Swan' }.deep_update!({ :email => 'new_email@example.com' })
  #   => { :email => 'new_email@example.com', :name => 'Graham Swan' }
  #
  # Returns the calling hash with the updated values.
  def deep_update! new_hash={}
    new_hash.each_pair do |key, val|
      if val.class.eql? Hash
        self[key] = {} if self[key].nil? # Include settings defined in a specific environment (even when they're not defined in the 'all' environment)
        self[key].deep_update! val
      else
        self[key] = val
      end
    end
    
    self
  end
end

# Public: Extends Rails' HashWithIndifferentAccess class to provide a method for accessing a hash's values with dot syntax.
module ActiveSupport
  class HashWithIndifferentAccess < Hash
    # Public: Causes '{}.arg' to call '{}[:arg]'.
    #
    # Note: None of the HashWithIndifferentAccess methods will work here. (http://as.rubyonrails.org/classes/HashWithIndifferentAccess.html)
    #   The aforementioned methods will invoke their expected functionality.
    #
    # Examples
    #
    #   (HashWithIndifferentAccess.new({ :country => 'Canada' })).country
    #   => 'Canada'
    #
    # Returns the calling hash with the updated values.
    def method_missing(method, *args)
      self[method]
    end
  end
end

# Public: An initializer that provides global access to the App constant (which holds all settings from config/app.yml).
#
# Thanks to Adrian Danieli (http://sickpea.com/2009/6/rails-app-configuration-in-10-lines) for this idea.
module App
  # Causes App.arg to call App[arg].
  #
  # Eg: App.country would call App[:country]
  def self.method_missing(method, *args)
    self[method, *args]
  end
  
  # Causes App[arg] to return @@settings[arg].
  #
  # Eg: If @@settings = { :country => 'Canada' }, then App[:country] will return @@settings[:country] == 'Canada'
  def self.[](*args)
    args.inject(@@settings) { |hash, arg| hash[arg] }
  end
  
  # Parses 'config/app.yml' and converts it into a HashWithIndifferentAccess (which provides us with dot syntax).
  # 
  # See 'config/app.yml' for examples.
  def self.build_settings_hash
    # Create a hash out of config/app.yml
    yaml = YAML.load(ERB.new(File.read(Rails.root.join('config', 'app.yml'))).result)

    # Fetch settings from the all: section
    @@settings = yaml['all']

    # Merge in settings from the current environment's section, giving the environment's settings precedence
    @@settings.deep_update! yaml[Rails.env] || {}

    # Allow this hash's data to be accessed with both strings and symbols
    @@settings = HashWithIndifferentAccess.new @@settings
  end
  
  # Initialize the settings hash
  @@settings = {}
  self.build_settings_hash
end
