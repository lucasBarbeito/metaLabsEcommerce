class ApplicationController < ActionController::Base

  def load_cart
    @cart = Cart.where(user_id: current_user.id).first if current_user
  end

end
