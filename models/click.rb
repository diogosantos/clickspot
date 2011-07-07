require 'mongo_mapper'

class Click
  include MongoMapper::Document
  
  key :url, String, :required => true
  key :x, Integer, :required => true
  key :y, Integer, :required => true
  timestamps!
  
  validates_format_of :url, :with => URI::regexp(%w(http https))
end