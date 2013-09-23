$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'config/main'
require 'date'
enable :sessions

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

get '/login' do
  erb :login
end

post '/login' do

end

