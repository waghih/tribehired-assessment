# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'spec_helper'
require 'swagger_helper'
require 'webmock/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.include ApiHelper, type: :request
  config.include Requests::JsonHelpers, type: :request

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
