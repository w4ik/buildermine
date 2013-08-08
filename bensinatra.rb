require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model'

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
