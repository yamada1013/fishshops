class AddOrdernameToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ordername, :string
  end
end
