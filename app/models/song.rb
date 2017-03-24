class Song < ActiveRecord::Base
  belongs_to :songable, polymorphic: true
  
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  has_many :users, class_name: "User", through: :playlists

  validates :title, :artist, length: { minimum: 2 }
end
