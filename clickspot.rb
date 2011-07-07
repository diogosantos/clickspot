require 'rubygems'
require 'sinatra'
require './models/click'

configure :development do
  MongoMapper.database = 'clickspot'
end

get "/" do
  "ok"
end