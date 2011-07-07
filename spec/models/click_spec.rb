require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Click" do
  
  def valid_click_attributes 
    { :x => 30,
      :y => 200,
      :url => "http://myurl.com" }
  end
  
  before(:each) do
    @click = Click.new
  end
  
  it "should be invalid without a number x, related to the horizontal position" do
    @click.attributes = valid_click_attributes.except(:x)
    @click.should be_invalid()
    @click.x = 30
    @click.should be_valid()
  end
  
  it "should be invalid without a number y, related to the vertical position" do
    @click.attributes = valid_click_attributes.except(:y)
    @click.should be_invalid()
    @click.y = 200
    @click.should be_valid()
  end
  
  it "should be invalid without a url" do
    @click.attributes = valid_click_attributes.except(:url)
    @click.should be_invalid()
    @click.url = "http://myurl.com"
    @click.should be_valid()
  end
  
  it "should be invalid with an invalid url" do
    @click.attributes = valid_click_attributes.except(:url)    
    @click.url = "myurl"
    @click.should be_invalid()
    @click.url = valid_click_attributes[:url]
    @click.should be_valid()
  end
  
end