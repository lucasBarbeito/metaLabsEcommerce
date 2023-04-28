class CartsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :load_cart, only: [:update, :show]
  before_action :check_cart_found, only: [:update, :show]

  rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    cart_product = @cart.cart_products.find_by(product_id: @product.id)
    if cart_product && quantity > 0
      cart_product.update(quantity)
    elsif  quantity <= 0
      cart_product.destroy
    else
      @cart.cart_products.create(product: @product, quantity: quantity)
    end
  end

  def remove
    CartProduct.find_by(id: params[:id]).destroy
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    cart = build_cart

    respond_to do |format|
      if cart.save
        format.html { redirect_to cart_url(cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: cart }
      else
        render json: data, status: :unprocessable_entity
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Se vacio tu carrito." }
      format.json { head :no_content }
    end
  end

  private
    # def set_cart
    #   @cart = Cart.find(params[:id])
    # end

    def build_cart
      cart = Cart.new(cart_params)
      cart.user = current_user
      cart
    end

    def cart_not_found
      logger.error "No se encuentra el Carrito #{params[:id]}"
      redirect_to products_path, notice: "Carrito no encontrado"
    end

  def cart_params
    params.require(:cart).permit(
      cart_products_attributes: [
        :id, :product_id, :quantity, :_destroy
      ]
    )
  end

  def check_cart_found
    head :not_found unless @cart
  end

end
