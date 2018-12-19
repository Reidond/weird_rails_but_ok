class AddUserNameToToMemes < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :user_name, :string
  end
end
