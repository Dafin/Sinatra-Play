require 'dm-core'
require 'dm-migrations'


DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Pin
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

get '/pins' do
	@pin = Pin.all
	slim :pins	
end 


#new

get '/pins/new' do
	@pin = Pin.new
	erb :new_pin	
end 

#edit


get 'pins/:id/edit' do
	@pin = Pin.get(params[:id])
	slim :edit_pin	
end

#show

get 'pins/:id/' do
	@pin = Pin.get(params[:id])
	slim :show_pin
end



#create

post '/pins' do
	pin = Pin.create(params[:pin])
	redirect to("/pins/#{pin.id}")
end


#update

put '/pin/:id' do
	pin = Pin.get(params[:id])
	pin.update(params[:pin])
	redirect to ('/pins/#{pin.id}')

end


#destroy

	delete 'pin/:id' do
	Pin.get(params[:id]).destroy
	redirect to ('/pins')

end




