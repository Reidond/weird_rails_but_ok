class AddMemeTypeToMemes < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :meme_type, :integer
  end
end
