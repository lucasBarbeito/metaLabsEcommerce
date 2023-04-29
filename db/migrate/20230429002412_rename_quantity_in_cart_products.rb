class RenameQuantityInCartProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :cart_products, :quantitiy, :quantity
  end
end
