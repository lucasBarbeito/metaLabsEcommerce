class Product < ApplicationRecord
  has_many :cart_products

  scope :in_stock, -> {
    products_in_stock = where.not(stock: nil).select { |product| 0 < product.stock }
    where(id: products_in_stock.pluck(:id))
  }

  def reduce_stock
    update_column(:stock, stock - 1)
  end
end
