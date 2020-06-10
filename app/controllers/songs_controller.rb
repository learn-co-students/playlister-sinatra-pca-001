require 'rack-flash'
class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.create(params[:song])
    song.artist = Artist.find_or_create_by(params[:artist])
    song.genre_ids = params[:genres]
    song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    if params[:artist].present?
      song.artist = Artist.find_or_create_by(params[:artist])
    end
    song.genre_ids = params[:genres]
    song.save
    redirect to "/songs/#{song.slug}"
  end

end
