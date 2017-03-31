class AddUserIdToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :user_id, :string
    add_index :cards, :user_id
  end
end
