$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'sinatra'
require 'config/main'

get '/' do
	erb :index
end