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
  
  it "should create a new record" do
    click_count = Click.count
    post '/click', { :url => 'http://www.google.com', :x => 30, :y => 80 }
    Click.count.should == click_count + 1
  end
  
end