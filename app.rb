require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

require './pin.rb'

DataMapper.finalize

DataMapper.auto_migrate!

require 'erb'

get '/' do
	slim :home
	# erb :pin_location
end

# post '/' do
#   @task =  params[:pin]
#   slim :pin
# end