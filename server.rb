require 'sinatra'
require 'shotgun'
require 'sinatra/base'
require 'rack-flash'
require './lib/helpers/display_helper'
require './lib/helpers/logic_helper'

include DisplayHelper
include LogicHelper

enable :sessions
set :session_secret, '13r0uafpuwgqeß9awe8f'
use Rack::Flash

get '/' do
	erb :index
end

post '/' do
	@roll_one = params[:roll_one]
	@roll_two = params[:roll_two]
	correct_format?		
	erb :index
end

