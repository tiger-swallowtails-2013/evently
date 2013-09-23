require 'pathname'
require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

VIEW_PATH = APP_ROOT.join('app','views').to_s

PUBLIC_PATH = APP_ROOT.join('public').to_s

configure do
  set :views, VIEW_PATH
end

configure do 
  set :public_folder, PUBLIC_PATH
end