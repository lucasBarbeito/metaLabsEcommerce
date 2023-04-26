class Product < ApplicationRecord

  scope :in_stock, -> {
    products_in_stock = where.not(stock: nil).select { |product| 0 < product.stock }
    where(id: products_in_stock.pluck(:id))
  }

end
