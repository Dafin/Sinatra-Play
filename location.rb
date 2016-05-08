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


#index

get '/locations' do
	@location = Location.all
	slim :locations	
end 


#new

get '/locations/new' do
	@location = Location.new
	slim :new_location	
end 

#edit


get 'locations/:id/edit' do
	@location = Location.get(params[:id])
	slim :edit_location
end

#show

get 'locations/:id/' do
	@location = Location.get(params[:id])
	slim :show_location
end



#create

post '/locations' do
	location = Location.create(params[:location])
	redirect to("/locations/#{location.id}")
end


#update

put '/location/:id' do
	location = Location.get(params[:id])
	location.update(params[:location])
	redirect to ('/locations/#{location.id}')

end


#destroy

	delete 'location/:id' do
	Location.get(params[:id]).destroy
	redirect to ('/locations')

end




