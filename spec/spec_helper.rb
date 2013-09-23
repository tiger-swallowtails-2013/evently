ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'rack/test'
include Rack::Test::Methods
require_relative '../app/controllers/app'

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.before(:suite) do
    User.destroy_all
  end
end