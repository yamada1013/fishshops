class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :buyer_id
      t.timestamps
    end
  end
end
