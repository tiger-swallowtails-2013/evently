require 'sinatra'
require 'sinatra/activerecord/rake'
require_relative './app/controllers/app'

# Use the followint to control with environment is set
# RACK_ENV=test rake db:create
desc "create a local pg database with call to exec"
task "db:create" do
  puts "touch #{DB_NAME} if it doesn't already exist"
  exec "createdb #{DB_NAME}"
end

desc "drop local pg database"
task "db:drop" do
  puts "rm-f #{DB_NAME}"
  exec "dropdb #{DB_NAME}"
end
