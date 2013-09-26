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

desc "populate database with seed data"
task "db:seed" do
  require_relative "./db/seeds.rb"
end

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end
