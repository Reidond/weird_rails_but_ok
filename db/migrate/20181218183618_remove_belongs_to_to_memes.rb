class RemoveBelongsToToMemes < ActiveRecord::Migration[5.2]
  def change
    remove_column :memes, :belongs_to, :user
  end
end
