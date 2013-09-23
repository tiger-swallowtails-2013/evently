require 'pathname'
require 'sinatra'
require 'sinatra/activerecord'
require 'app/models/user'
require 'tux' unless settings.production?

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

VIEW_PATH = APP_ROOT.join('app','views').to_s

PUBLIC_PATH = APP_ROOT.join('public').to_s

configure do
  set :views, VIEW_PATH
  set :public_folder, PUBLIC_PATH
end

ENV['RACK_ENV'] == 'test' ? DB_NAME = "eventlydb_test" : DB_NAME = "eventlydb"
ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || "postgresql://localhost/#{DB_NAME}")