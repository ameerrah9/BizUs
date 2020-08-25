ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :environment do
    require './config/environment.rb'
end

task :console => :environment do
    Pry.start
end