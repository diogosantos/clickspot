require File.dirname(__FILE__) + '/spec_helper'

describe "Clickspot" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
  
  it "should create a new record when post to /click"  do
    click_count = Click.count
    post '/click', { :url => 'http://www.google.com', :x => 30, :y => 80 }
    Click.count.should == click_count + 1
  end
  
  it "should return a list of clicks when get to /click/all/:url" do
    Click.create({:x => 30, :y => 100, :url => 'http://www.google.com'})    
    get '/click/all?url=http://www.google.com'
    response_hash = JSON.parse(last_response.body)
    Click.new(response_hash['clicks'][0]).url.should == 'http://www.google.com'
  end
  
end