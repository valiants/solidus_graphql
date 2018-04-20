# frozen_string_literal: true

if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'ffaker'
require 'database_cleaner'

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each {|f| require f }

require 'spree/testing_support/factories'
require 'spree/testing_support/preferences'

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false

  config.prepend_before(:each) do
    Rails.cache.clear
    reset_spree_preferences
  end

  config.include FactoryBot::Syntax::Methods
  config.include Spree::TestingSupport::Preferences
  config.example_status_persistence_file_path = "./spec/examples.txt"
end
