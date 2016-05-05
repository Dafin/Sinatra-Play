require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'


get '/' do
	slim :home
	
end


