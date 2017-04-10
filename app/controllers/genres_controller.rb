class GenresController < ApplicationController

  get '/genres/?' do
    erb :'/genres/index.html'
    # renders view with all genres in an unordered list
  end

  get '/genres/:slug/?' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show.html'
    # renders a view with all artists and songs by genre "/genres/dance"
  end

end
