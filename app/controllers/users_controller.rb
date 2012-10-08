class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def update
    if request.put?
      @user = User.find(params[:id])
      @user.products.first.delete
      redirect_to favorites_url, :notice => "Favorites Updated!"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
end