require "rack-flash"
class SongsController < ApplicationController
  # find_or_create_by(attr: "what")
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  post "/songs" do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    params[:genres].each { |x| @song.genres << Genre.find(x.to_i) }
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug.downcase}"
  end

  get "/songs/new" do
    @artist = Artist.all
    @genre = Genre.all
    erb :"songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    #{"_method"=>"patch", "artist"=>{"name"=>"Some Nobody"}, "song"=>{"name"=>""}, "id"=>"1"}
    #{"_method"=>"patch", "artist"=>{"name"=>""}, "song"=>{"name"=>""}, "genres"=>["1"], "id"=>"1"}
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug.downcase}"
  end
end
