require 'sinatra'

get '/' do
  haml :index 
end

get '/css/main.css' do
  scss :main
end
