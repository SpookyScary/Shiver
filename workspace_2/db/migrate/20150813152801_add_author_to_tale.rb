class AddAuthorToTale < ActiveRecord::Migration
  def change
    add_column :tales, :author, :string
  end
end
