class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  def create(**args)
    binding.pry
  end
end
