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
  @user = User.create(params)
  start_session
  redirect '/'
end


get '/events/create' do
  erb :create_events
end

post '/events/create' do
  p datetime_ary = params[:date].split(/[\/-]/) + params[:time].split(':')
  @event = Event.create(
    :title => params[:title],
    :description => params[:desc],
    :location => params[:location],
    :datetime => DateTime.new(*datetime_ary.map{|e| e.to_i}),
    :user_id => current_user.id
    )
  redirect "/events/#{@event.id}"
end

get '/events/:event_id/rsvp' do
  @event = Event.find(params[:event_id])
  erb :new_rsvp
end

post '/events/:event_id' do
  @event = Event.find(params[:event_id].to_i)
  @guest = Guest.new(
    :name => params[:name],
    :email => params[:email],
    :rsvp? => (params[:rsvp] == 'true'))
  @guest.event = @event
  @guest.save
  redirect '/'
end

get '/events/:event_id/invite' do
  @event = Event.find(params[:event_id])
  erb :invite
end

get '/oops' do
  erb :oops
end

get '/events/:event_id' do
  @event = Event.find(params[:event_id])
  redirect '/oops' unless @event.user == current_user
  erb :events
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

