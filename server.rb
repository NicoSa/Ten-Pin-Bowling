require 'sinatra'
require 'shotgun'

get '/' do
	erb :index
end

post '/' do
	@roll_one = params[:roll_one]
	@roll_two = params[:roll_two]
	erb :index
end