class Hash
  # Allows us to override app.yml settings from the 'all' environment with the current environment with unlimited nesting
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

module ActiveSupport
  class HashWithIndifferentAccess < Hash
    # Causes {}.arg to call {}[:arg]
    #
    # Eg: { :country => 'Canada' }.country would call { :country => 'Canada' }[:country] == 'Canada'
    #
    # Note: None of the HashWithIndifferentAccess methods will work here. (http://as.rubyonrails.org/classes/HashWithIndifferentAccess.html)
    #       The actual methods will invoke their expected functionality.
    #       These are: convert_key
    #                  convert_value
    #                  default
    #                  delete
    #                  dup
    #                  fetch
    #                  key?
    #                  merge
    #                  new
    #                  stringify_keys!
    #                  symbolize_keys!
    #                  to_hash
    #                  to_options!
    #                  update
    #                  values_at
    def method_missing(method, *args)
      self[method]
    end
  end
end
