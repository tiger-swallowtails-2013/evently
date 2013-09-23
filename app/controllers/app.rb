$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'sinatra'
require 'config/main'
require 'sinatra/activerecord'
require 'app/models/user'
require 'tux' unless settings.production?

DB_NAME = "eventlydb"
set :database, ENV["DATABASE_URL"] ||= "postgresql://localhost/eventlydb"

get '/' do
	erb :index
end