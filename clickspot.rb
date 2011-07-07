require 'rubygems'
require 'sinatra'
require './models/click'

configure :development do
  MongoMapper.database = 'clickspot'
end

configure :production do
  MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com', 10010)
  MongoMapper.database = 'clickspot'
  MongoMapper.database.authenticate(ENV['clickspot'], ENV['clickspot'])
end

get "/" do
  "ok"
end

post '/click' do
  click = Click.new(params)
  click.save!  
end