require 'rails_helper'

RSpec.describe "When a user adds songs to their cart" do
  it "a message is displayed" do
    # binding.pry
    artist = Artist.create(name: 'Rick Astley')
    # song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)
    visit songs_path

    click_button "Add Song #{song.id}"

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
  end

  it "the message updates when the song is added again" do
    # artist = Artist.create(name: 'Rick Astley')
    # song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)

    visit songs_path


    click_button "Add Song #{song.id}"

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")

    click_button "Add Song #{song.id}"

    expect(page).to have_content("You now have 2 copies of #{song.title} in your cart.")
  end
end
