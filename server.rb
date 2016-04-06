require 'sinatra'
require 'rest-client'
require 'json'


CLIENT_ID = ENV['GH_CLIENT_ID']
CLIENT_SECRET = ENV['GH_CLIENT_SECRET']

get '/' do
  erb :index, :locals => {:client_id => CLIENT_ID}
end
