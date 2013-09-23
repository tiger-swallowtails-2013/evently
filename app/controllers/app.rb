$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'config/main'
enable :sessions


get '/' do
	erb :index
end

get '/login' do
  erb :login
end

post 'login' do

end