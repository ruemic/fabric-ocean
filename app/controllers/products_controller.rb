class ProductsController < ApplicationController

  before_filter :require_login, :only => :show

  # GET /products
  def index
    if params[:tag]
      @header_name = params[:tag].titleize
      @products = Product.tagged_with(params[:tag]).page(params[:page]).per_page(8)
    else
      @header_name = "Fabric"
      @products = Product.order("id").page(params[:page]).per_page(8)
    end
  end

  def favorites
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create(params[:product])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_url, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Product was successfully deleted."
  end
end
