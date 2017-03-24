class AddSongToPlaylistSongs < ActiveRecord::Migration
  def change
    add_reference :playlist_songs, :song, index: true, foreign_key: true
  end
end
