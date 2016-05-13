require 'sinatra/activerecord'

class User  < ActiveRecord::Base
    # include DataMapper::Resource

    # property :id, Serial
# unlike , AR, which gives id automatically 
    # property :firstname, String
    # property :surname, String
    has_many :pins 
    
end


#index

get '/users' do
	@users = User.all
	slim :users	
end 


#new

get '/users/new' do
	@pin = Pin.new
	erb :new_user	
end 

#edit


get '/users/:id/edit' do
	@user = User.find(params[:id])
	slim :edit_user	
end

#show

get '/users/:id' do
	@user = User.find(params[:id])
	slim :show_user
end


#create

post '/users' do
	user = User.create(params[:user])

	redirect to("/users/#{User.id}")
end


#update

put '/users/:id' do
	user = User.find(params[:id])
	User.update(params[:user])
	redirect to ('/users/#{User.id}')

end

#destroy

	delete '/users/:id' do
	User.find(params[:id]).destroy
	redirect to ('/users')

end




