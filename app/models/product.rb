class Product < ApplicationRecord
  has_many :cart_products
  after_commit :in_stock

  scope :in_stock, -> {
    where('stock IS NULL OR stock > ?', 0).order(id: :asc)
  }

  def reduce_stock(amount)
    update_column(:stock, stock - amount)
  end

  def increase_stock(amount)
    update_column(:stock, stock + amount)
  end

end
