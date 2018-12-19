class AddUserIdToMemes < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :user_id, :integer
  end
end
