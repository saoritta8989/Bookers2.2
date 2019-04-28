class RemoveBookFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :book, :string
  end
end
