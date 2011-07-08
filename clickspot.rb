require 'json'
require 'rubygems'
require 'sinatra'
require './models/click'
require 'uri'

configure :development do
  MongoMapper.database = 'clickspot'

  set :logging, true
end

configure :production do
  MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com', 10012)
  MongoMapper.database = 'app592827'
  MongoMapper.database.authenticate('heroku', 'heroku')
end

get "/" do
  "ok"
end

post '/click' do
  click = Click.new(params)
  click.save!  
end

get '/click/all' do
  content_type :json  
  { :clicks => Click.find_all_by_url( params[:url] ) }.to_json
end