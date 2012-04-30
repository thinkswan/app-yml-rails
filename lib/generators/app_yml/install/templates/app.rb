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
