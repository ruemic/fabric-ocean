class FavoritesController < ApplicationController

  before_filter :require_login

  def create
    Favorite.create(:user_id => params[:user_id], :product_id => params[:product_id])
    redirect_to (Product.find(params[:product_id]))
  end

  def index
    @products = Favorite.where(:user_id => current_user.id).map(&:product)
  end
end
