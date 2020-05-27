class DropUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :users
    drop_table :user
  end
end
