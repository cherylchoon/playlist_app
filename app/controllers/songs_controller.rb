class SongsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @new_song = Song.new
    @all_songs = Song.all
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to songs_path
    end
  end

  def show
    @song = Song.find(params[:id])
    @users = @song.users.distinct
  end

  protected
    def song_params
      params.require(:song).permit(:title, :artist)
    end
end
