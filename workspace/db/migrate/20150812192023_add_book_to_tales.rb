class AddBookToTales < ActiveRecord::Migration
  def change
    add_column :tales, :book, :string
  end
end
