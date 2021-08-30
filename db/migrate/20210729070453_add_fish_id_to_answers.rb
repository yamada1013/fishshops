class AddFishIdToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :fish_id, :integer
  end
end
