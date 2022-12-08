class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :text
      t.datetime :updatedat
      t.datetime :createdat
      t.string :title
      t.integer :likescounter

      t.timestamps
    end
  end
end
