require 'test_helper'
 
class CoreExtTest < Test::Unit::TestCase
  @@all_hash = {
    :emails => {
      :admin => 'admin@example.com',
      :support => 'support@example.com',
      :billing => 'billing@example.com',
      :team => {
        :ceo => 'ceo@example.com',
        :cto => 'cto@example.com'
      }
    },
    :max_search_results => 20,
    :app_name => 'My Amazing Application'
  }
  @@dev_hash = {
    :emails => {
      :admin => 'admin@localhost',
      :team => {
        :ceo => 'ceo@localhost'
      }
    },
    :app_name => 'My Amazing Application (development)'
  }
  
  def test_hash_dot_syntax
    hash_with_indifferent_access = HashWithIndifferentAccess.new @@all_hash
    
    assert_equal 'ceo@example.com', hash_with_indifferent_access.emails.team.ceo
    assert_equal 20, hash_with_indifferent_access.max_search_results
  end
  
  def test_hash_deep_update
    all_hash_copy = Marshal.load Marshal.dump @@all_hash # Make a deep copy of @@all_hash (so that it maintains its state for subsequent tests)
    all_hash_copy.deep_update @@dev_hash
    app_hash = HashWithIndifferentAccess.new all_hash_copy
    
    assert_equal 'admin@localhost', app_hash.emails.admin
    assert_equal 'ceo@localhost', app_hash.emails.team.ceo
    assert_equal 'My Amazing Application (development)', app_hash.app_name
    
    assert_equal 'support@example.com', app_hash.emails.support
    assert_equal 'cto@example.com', app_hash.emails.team.cto
    assert_equal 20, app_hash.max_search_results
  end
end
