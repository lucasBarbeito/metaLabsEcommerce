class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  enum status: { pending: 0, closed: 1, discarded: 2 }


  def total
    cart_products.to_a.sum { |cart_product| cart_product.total}
  end
end
