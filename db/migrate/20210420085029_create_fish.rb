class CreateFish < ActiveRecord::Migration[6.1]
  def change
    create_table :fish do |t|
      t.integer :seller_id
      t.string :fishname
      t.text :body
      t.string :image_id
      t.timestamps
    end
  end
end
