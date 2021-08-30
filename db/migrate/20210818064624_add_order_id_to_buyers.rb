class AddOrderIdToBuyers < ActiveRecord::Migration[6.1]
  def change
    add_column :buyers, :order_id, :integer
  end
end
