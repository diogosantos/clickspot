require 'rubygems'
require 'sinatra'
require './models/click'

configure :development do
  MongoMapper.database = 'clickspot'
end

configure :production do
  MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com', 10012)
  MongoMapper.database = 'app592827'
  MongoMapper.database.authenticate(ENV['heroku'], ENV['heroku'])
end

get "/" do
  "ok"
end

post '/click' do
  click = Click.new(params)
  click.save!  
end