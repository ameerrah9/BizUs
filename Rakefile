ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :environment do # loads my environment
    require_relative './config/environment.rb'
end

task :console => :environment do
    Pry.start
end