class AddQuantityToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :quantity, :integer, default: 1
  end
end
