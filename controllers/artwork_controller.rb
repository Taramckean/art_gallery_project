require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('../models/artwork')
also_reload('../models/*')


get '/gallery/artworks' do
  @artworks = Artwork.all()
  erb(:"artworks")
end

get '/gallery/artworks/:id' do
  @artworks = Artwork.find(params[:id])
  erb(:"view_artwork")
end

get '/gallery/new_artwork' do
    @artists = Artist.all()
  erb(:"new_artwork")
end

post '/gallery/artworks' do
  Artwork.new(params).save()
  redirect to '/gallery/artworks'
end

get '/gallery/artworks/:id/edit' do
  @artists = Artist.all()
  @artworks = Artwork.find(params[:id])
  erb(:edit)
end

post '/gallery/artworks/:id' do
  artwork = Artwork.new(params)
  artwork.update()
  redirect to 'gallery/artworks'
end

post '/gallery/artworks/:id/delete' do
  Artwork.delete(params[:id])
  redirect to '/gallery/artworks'
end
