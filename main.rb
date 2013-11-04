require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  haml :index 
end

get '/css/main.css' do
  scss :main
end

get '/js/main.js' do
  coffee :main
end
