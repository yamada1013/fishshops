class CreateBuyerfishes < ActiveRecord::Migration[6.1]
  def change
    create_table :buyerfishes do |t|
      t.integer :buyer_id
      t.integer :fish_id

      t.timestamps
    end
  end
end
