require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/artists'

get '/' do 
   redirect '/artists' 
end

get '/artists' do 
  @artists = Artist.all
  erb :index
end

get '/artists/new' do 
  erb :new
end

get '/artists/:id' do 
  @artists = Artist.find(params[:id])
  erb :show
end

get '/artists/:id/edit' do
  @artists = Artist.find(params[:id])
  erb :edit
end

post '/artists' do
  Artist.create({:name => params[:name]})
redirect '/artists'
end

put '/artists/:id' do
  artist = Artist.find(params[:id])
  artist.name = params[:name]
  artist.save
  # could have also used update()
  redirect '/artists'
end

delete '/artists/:id' do
  artist = Artist.find(params[:id])
  artist.destroy
  redirect '/artists'
end