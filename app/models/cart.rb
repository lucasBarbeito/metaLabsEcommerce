class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def add_product(product)
    return if product.stock == 0
    product.reduce_stock
    current_product = cart_products.find_by(product_id: product.id)
    current_product ? current_product.quantity += 1 : current_product = cart_products.build(product_id: product.id)
    current_product
  end


  def total_price
    cart_products.to_a.sum { |product| product.total_price }
  end
end
