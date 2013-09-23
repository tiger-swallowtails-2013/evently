$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'sinatra'
require 'config/main'
require 'sinatra/activerecord'
require 'app/models/user'
require 'app/models/event'
require 'tux' unless settings.production?
require 'date'

ENV['RACK_ENV'] == 'test' ? DB_NAME = "eventlydb_test" : DB_NAME = "eventlydb"
ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || "postgresql://localhost/#{DB_NAME}")

get '/' do
	erb :index
end


get '/create_event' do
  erb :create_events
end

post '/create_event' do
  datetime_ary = params[:date].split('-') + params[:time].split(':')
  Event.create(
    :title => params[:title],
    :description => params[:desc],
    :location => params[:location],
    :datetime => DateTime.new(*datetime_ary.map{|e| e.to_i})
    )

end
