# This is the DataMapper version
# require 'dm-core'
# require 'dm-migrations'


# DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Pin < ActiveRecord::Base

    belongs_to :user



    # include DataMapper::Resource

    # property :id, Serial
# unlike , AR, which gives id automatically 
    # property :title, String
    # property :lat, Float
    # property :lng, Float
    # property :blurb, Text

    
end


#index

get '/pins' do
	@pins = Pin.all
	slim :pins	
end 


#new

get '/pins/new' do
	@pin = Pin.new
	erb :new_pin	
end 

#edit


get '/pins/:id/edit' do

	# .get() below becomes .find() in AR
	@pin = Pin.find(params[:id])
	slim :edit_pin	
end

#show

get '/pins/:id' do
	@pin = Pin.find(params[:id])
	slim :show_pin
end


#create

post '/pins' do
	pin = Pin.create(params[:pin])

	redirect to("/pins/#{pin.id}")
end


#update

put '/pins/:id' do
	# binding.pry
	pin = Pin.find(params[:id])
	pin.update(params[:pin])
	redirect to("/pins/#{pin.id}")

end

#destroy

	delete '/pins/:id' do
	Pin.find(params[:id]).destroy
	redirect to ('/pins')

end




