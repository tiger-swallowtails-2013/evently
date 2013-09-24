$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))
require 'config/main'
require 'app/controllers/session_helper'

enable :sessions

get '/' do
	erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  p params.inspect
  User.create(params)
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