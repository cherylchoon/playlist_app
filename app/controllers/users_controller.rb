class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @playlist = Playlist.create(user: @user)
    if @user.save
      flash[:errors] = ["You have registered succesfully, please log in."]
      redirect_to main_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to main_path
    end
  end

  def show
    @user = User.find(params[:id])
    @playlist = Playlist.find_by(user: @user)
    @songs = @playlist.songs
    @timesadded = PlaylistSong.where("playlist_id=?", @playlist.id)
  end

  protected
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
