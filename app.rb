require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require './location.rb'


get '/' do
	slim :home
	
end

