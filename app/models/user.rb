class User < ActiveRecord::Base
  has_secure_password
  has_one :playlist
  has_many :playlist_songs, through: :playlist


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }, on: :create
end
