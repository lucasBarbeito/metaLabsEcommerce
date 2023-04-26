class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.in_stock.all
  end

  def show
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock)
  end
end