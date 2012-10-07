class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def favorites
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  protected
  def update_favorites(opts={})
    # default the favorite type to Product
    type = opts[:type] ? opts[:type] : :product

    # create symbol, plural symbol, and constant objects for selected type
    type = type.to_sym
    type_plural = type.to_s.pluralize.to_sym
    type_constant = type.to_s.capitalize.constantize

    if params[:favorites]
      # if any of our favorites input objects are checked, do this:
      if params[:favorites][type_plural].size > 0
        #
        old_fav = @user.favorable(:type => type)
        old_fav.each do |of|
          of.delete unless params[:favorites][type_plural].member?(of.id)
        end

        params[:favorites][type_plural].each do |id|
          current_fav = @user.favorable(:type => type, :id => id)
          unless current_fav.size > 0
            new_fav = type_constant.find(id)
            new_fav.favorites.build(:user_id => @user.id).save
          end
        end
      end
    else
      @user.favorable(:type => type).each do |uf|
        uf.destroy
      end
    end
  end

end