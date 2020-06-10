
class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    @artists = Artist.all
    @genres = Genre.all

    erb :"songs/new"
  end


  post "/songs" do
    song = Song.create(params[:song])

    if params["artist"] && params["artist"]["name"] != ""
      artist = Artist.find_or_create_by(params["artist"])
      song.update(artist: artist)
    end

    if params["genre"] && params["genre"]["name"] != ""
      genre = Genre.find_or_create_by(params["genre"]) if params["genre"]
      song.genres << genre
    end
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{song.slug}")
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])

    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    @song    = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres  = Genre.all

    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])

    if params["artist"] && params["artist"]["name"] != ""
      artist = Artist.find_or_create_by(params["artist"])
      song.update(artist: artist)
    end

    if params["genre"] && params["genre"]["name"] != ""
      genre = Genre.find_or_create_by(params["genre"]) if params["genre"]
      song.genres << genre
    end
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{song.slug}")
  end

  #   #  #####        #  ######
  #   #    #          #  #    #
  # # #    #          #  #    #
  #   #    #      #   #  #    #
  #   #  #####    #####  ######
end
