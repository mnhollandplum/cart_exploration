class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    song = Song.find(params[:song_id])
    session[:cart] ||= Hash.new(0)
    session[:cart][song.id] ||= 0
    session[:cart][song.id] = session[:cart][song.id] + 1
    quantity = session[:cart][song.id]
    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{song.title} in your cart."
    redirect_to songs_path
  end
end
