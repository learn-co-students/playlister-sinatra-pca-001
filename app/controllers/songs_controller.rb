class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :"/songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :"/songs/new"
  end

  post "/songs" do
    song = Song.create(params[:song])
    song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"/songs/edit"
  end

  patch "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])

    if !params[:artist][:name].empty?
      song.artist = Artist.find_or_create_by(params[:artist])
      song.save
    end
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end
end
