class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  def show
    @cart.cart_products
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    cart_product = @cart.cart_products.find_by(product_id: @product.id)
    if cart_product && quantity > 0
      cart_product.update(quantity: cart_product.quantity + quantity)
      @product.reduce_stock(quantity)
    elsif quantity <= 0
      cart_product.destroy
    else
      @cart.cart_products.create(product: @product, quantity: quantity)
      @product.reduce_stock(quantity)
    end
    redirect_to carts_path
  end

  def remove
    cart_product = CartProduct.find_by(id: params[:id])
    cart_product.product.increase_stock(cart_product.quantity)
    cart_product.destroy
    redirect_to products_path
  end

  private

  def initialize_cart
    last_cart = current_user.carts.last

    if last_cart&.pending?
      @cart = last_cart
    else
      @cart = Cart.create(user: current_user)
    end

    session[:cart_id] = @cart.id
  end

  # def initialize_cart
  #   @cart = Cart.find_or_create_by(id: session[:cart_id]) do |cart|
  #     cart.user = current_user
  #   end
  #
  #   session[:cart_id] = @cart.id
  # end
end
