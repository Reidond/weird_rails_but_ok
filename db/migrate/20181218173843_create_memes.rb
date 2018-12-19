class CreateMemes < ActiveRecord::Migration[5.2]
  def change
    create_table :memes do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
