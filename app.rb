require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require './location.rb'
require 'erb'


get '/' do
	slim :home
	# erb :new_location
end

# post '/' do
#   @task =  params[:location]
#   slim :location
# end