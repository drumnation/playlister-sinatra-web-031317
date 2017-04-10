class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  use Rack::Flash
  # use these to enable rack-flash3

  def all_artists
    Artist.all
    # makes all artist objects available to erb pages
  end

  def all_genres
    Genre.all
    # makes all genre objects available to erb pages
  end

  def all_songs
    Song.all
    # makes all song objects available to erb pages
  end

  get '/' do
    erb ':index.html'
    # renders default index page
  end

end
