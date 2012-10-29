class FavoritesController < ApplicationController

  before_filter :require_login

  def create
    Favorite.create(:user_id => params[:user_id], :product_id => params[:product_id])
    redirect_to (Product.find(params[:product_id])), notice: "Favorite added!"
  end

  def index
    @favorites = Favorite.where(:user_id => current_user.id)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_url, notice: "Favorite was successfully deleted."
  end

end
