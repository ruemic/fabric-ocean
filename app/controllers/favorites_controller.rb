class FavoritesController < ApplicationController

  respond_to :json
  before_filter :require_login

  def index
    @header_name = "Favorites"
    @favorites = Favorite.where(:user_id => current_user.id)
  end

  def create
    Favorite.create(:user_id => params[:user_id], :product_id => params[:product_id])
    # redirect_to (Product.find(params[:product_id])), notice: "Favorite added!"
  end

  def destroy
    @favorite = Favorite.find(:all, :conditions => { :user_id => params[:user_id], :product_id => params[:product_id]} ).first
    @favorite.destroy
    redirect_to favorites_url, notice: "Favorite was successfully deleted."
  end

end
