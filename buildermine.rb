require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require './config/environments' #database configuration
require './models/task'
#require './models/pokemon'
require 'json'
require 'bundler/setup'

get '/' do
  #"Buildermine, use this as the/an api?"
  erb :index	
end

get '/testreturn' do
  "Does this work?"
 end

post '/submit' do
  #Try different names or try make a different class named Task	
  @task = Task.new(params[:task])
  if @task.save
    redirect '/tasks'
  else
    "Sorry, there was an error!"
  end
end

get '/tasks' do
  #"Save Worked?"	
  @tasks = Task.all
  erb :tasks
end

post 'tosubtask' do


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
  data = JSON.parse(request.body.read)
  json data
  #'Does this work' #Yes!
end
