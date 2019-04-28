class AddBookToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :book_string, :string
  end
end
