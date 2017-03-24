class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :playlist_songs, :user_id
  end
end
