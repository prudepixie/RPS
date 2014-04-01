require_relative '../lib/rps.rb'


RSpec.configure do |config|
  # Configure each test to always use a new singleton instance
  config.before(:each) do
    RPS.instance_variable_set(:@__db_instance, nil)
  end
end
