$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))
require 'config/main'
require 'app/controllers/session_helper'
require 'date'
enable :sessions

get '/' do
	erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  User.create(params)
  redirect '/'
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

get '/login' do
  erb :login
end

post '/login' do
  @email = params[:email]
  @password = params[:password]
  login
  logged_in? ? (redirect '/') : (redirect '/signup')
end

get '/logout' do
  erb :logout
end

post '/logout' do
  logout
  redirect '/'
end

