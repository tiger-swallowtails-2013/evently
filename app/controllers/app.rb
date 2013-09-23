$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'sinatra'
require 'config/main'
require 'sinatra/activerecord'
require 'app/models/user'
require 'tux' unless settings.production?

ENV['RACK_ENV'] == 'test' ? DB_NAME = "eventlydb_test" : DB_NAME = "eventlydb"
ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || "postgresql://localhost/#{DB_NAME}")

get '/' do
	erb :index
end