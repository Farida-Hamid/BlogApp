class AddUserRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :authorid, null: false, foreign_key: true
  end
end
