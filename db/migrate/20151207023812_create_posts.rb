class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :attachment
      t.text :content
      t.references :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
