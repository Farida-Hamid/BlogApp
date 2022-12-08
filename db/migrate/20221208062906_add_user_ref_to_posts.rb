class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :authorid, null: false, foreign_key: true
  end
end
