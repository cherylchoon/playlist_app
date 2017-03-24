class PlaylistSongsController < ApplicationController
  def create
    @playlist_song = PlaylistSong.new(song_id: params[:song_id], playlist_id: params[:playlist_id])
    @song = Song.find(params[:song_id])
    @song.update(songable_type: "Playlist", songable_id: params[:playlist_id])
    
    if @playlist_song.save && @song.save
      redirect_to songs_path
    else
      flash[:errors] = @playlist_song.errors.full_messages
      redirect_to songs_path
    end
  end
end
