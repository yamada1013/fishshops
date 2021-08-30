class AddOrderIdToFish < ActiveRecord::Migration[6.1]
  def change
    add_column :fish, :order_id, :integer
  end
end
