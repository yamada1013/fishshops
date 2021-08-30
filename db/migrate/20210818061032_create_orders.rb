class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :address
      t.integer :price
      t.integer :fish_id
      t.integer :buyer_id
      t.integer :seller_id
      t.timestamps
    end
  end
end
