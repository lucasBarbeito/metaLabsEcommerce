class Payment < ApplicationRecord
  belongs_to :cart
  has_one :user, through: :cart

  enum status: {pending: 0, paid: 1}


  def total
    cart.total
  end

  def mark_as_paid
    paid!
  end
end
