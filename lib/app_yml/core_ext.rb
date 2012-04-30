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
