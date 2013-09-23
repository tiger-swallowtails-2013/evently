require 'sinatra'
require 'sinatra/activerecord'
require 'tux' unless settings.production?
require_relative './app/models/user'

DB_NAME = "eventlydb"



set :database, ENV["DATABASE_URL"] ||= "postgresql://localhost/eventlydb"