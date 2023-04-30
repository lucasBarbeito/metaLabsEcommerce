class UpdatePaymentStatusDefaultValue < ActiveRecord::Migration[7.0]
  def up
    change_column_default :payments, :status, 0
  end

  def down
    change_column_default :payments, :status, nil
  end
end
