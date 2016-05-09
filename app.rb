require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require './pin.rb'
require 'erb'


get '/' do
	slim :home
	# erb :pin_location
end

# post '/' do
#   @task =  params[:pin]
#   slim :pin
# end