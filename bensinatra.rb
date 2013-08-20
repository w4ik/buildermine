require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require './config/environments' #database configuration
require './models/model'
require './models/pokemon'
require 'json'
require 'bundler/setup'

get '/' do
  #"hey this is Ben's Sinatra site. Might use it as an API site"
  erb :index	
end

get '/testreturn' do
  "Does this work?"
 end

post '/submit' do
  @model = Model.new(params[:model])
  if @model.save
    redirect '/models'
  else
    "Sorry, there was an error!"
  end
end

get '/models' do
  @models = Model.all
  erb :models
end

post '/submitpokemon' do
  @pokemon = Pokemon.new(params[:pokemon])
  if @pokemon.save
    redirect '/viewpokemons'
  else
    "Sorry there was an error!"
  end
end

get '/pokemons' do
 #'Does this work?' #Yes!	
  @models = Pokemon.all
  erb :pokemons
end

get '/viewpokemons' do
 @pokemons = Pokemon.all	
 erb :viewpokemons
end

post '/testjson' do
  #data = JSON.parse(request.body.read)
  #json data
  'Does this work'
end
