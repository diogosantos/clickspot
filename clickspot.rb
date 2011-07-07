require 'rubygems'
require 'sinatra'
require './models/click'

configure :development do
  MongoMapper.database = 'clickspot'
end

get "/" do
  "ok"
end


post '/click' do
  click = Click.new(params)
  click.save!  
end