class ArtistsController < ApplicationController

  get '/artists/?' do
    erb :'/artists/index.html'
    # renders index.html view that iterates through all artist slugs
  end

  get '/artists/:slug/?' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show.html'
    # renders show.html which has a list of genres and songs by artist
  end

end
