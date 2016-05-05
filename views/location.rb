require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Location
    include DataMapper::Resource

    property :id, Serial
# unlike , AR, which gives id automatically 
    property :name, String
    property :lat, Float
    property :long, Float
    property :blurb, Text
    
end

DataMapper.finalize



get '/locations' do
	@location = Location.all
	slim :locations	
end 


get '/locations/new' do
	@location = Location.new
	slim :new_location	
end 

get '/edit' do
	...

end