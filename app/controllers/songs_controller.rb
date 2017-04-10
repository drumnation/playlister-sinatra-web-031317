class SongsController < ApplicationController
  get '/songs/?' do
    erb :'/songs/index.html'
    # renders a view with all songs listed by unordered list
  end

  get '/songs/new/?' do
    erb :'/songs/new.html'
    # renders a view with the create new song form
  end

  post '/songs/?' do
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{ @song.slug }"
    # create song with user params and save to instance variable song
    # if artist name empty is false set @song's artist to existing or newly created artist
    # if genre name empty is false << @song's genres to existing or newly created genre
    # save song
    # flash completed message
    # redirect to that song's page
  end

  get '/songs/:slug/edit/?' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit.html'
    # renders the edit form page for updating a new song
  end

  patch '/songs/:slug/?' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{ @song.slug }"
    # sets @song to the song object matching the song slug
    # updates @song using song parameters
    # if artist name empty is false set @song's artist to existing or newly created artist
    # if genre name empty is false << @song's genres to existing or newly created genre
    # saves song to database
    # flash successful message
    # redirect to song's slug url page
  end

  get '/songs/:slug/?' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show.html'
    # sets @song to the song object matching the song slug
  end
  
end
