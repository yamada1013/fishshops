class AddFishIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :fish_id, :integer
  end
end
