require 'sinatra'
require 'rest-client'
require 'json'


CLIENT_ID = ENV['GH_CLIENT_ID']
CLIENT_SECRET = ENV['GH_CLIENT_SECRET']

get '/' do
  erb :index, :locals => {:client_id => CLIENT_ID}
end


get '/callback' do
  #temp github code
  session_code = request.env['rack.request.quest_hash']['code']

  #post temp session_code to github

  result = RestClient.post('https://github.com/login/oauth/access_token',
    {:client => CLIENT_ID,
    :client_secret => CLIENT_SECRET,
    :code => session_code},
    :accept => :json
  )


  #take the token and scope from the result
  access_token = JSON.parse(result)['access_token']

  #checks to see the level of scope that you have
  scopes = JSON.parse(result)['scope'].split(',')
  has_user_email_scope = scopes.include? 'user:email'

end


get '/revoke' do
  erb: index, :locals => {:client_id => CLIENT_ID}

end
