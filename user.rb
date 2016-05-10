
class User
    include DataMapper::Resource

    property :id, Serial
# unlike , AR, which gives id automatically 
    property :firstname, String
    property :surname, String
    has n, :pins 
    
end


#index

get '/users' do
	@users = user.all
	slim :users	
end 


#new

get '/users/new' do
	@pin = Pin.new
	erb :new_user	
end 

#edit


get '/users/:id/edit' do
	@user = user.get(params[:id])
	slim :edit_user	
end

#show

get '/users/:id' do
	@user = user.get(params[:id])
	slim :show_user
end


#create

post '/users' do
	user = user.create(params[:user])

	redirect to("/users/#{user.id}")
end


#update

put '/users/:id' do
	user = user.get(params[:id])
	user.update(params[:user])
	redirect to ('/users/#{user.id}')

end

#destroy

	delete '/users/:id' do
	user.get(params[:id]).destroy
	redirect to ('/users')

end




