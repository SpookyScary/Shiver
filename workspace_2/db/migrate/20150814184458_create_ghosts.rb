class CreateGhosts < ActiveRecord::Migration
  def change
    create_table :ghosts do |t|
      t.string :username
      t.string :password
      t.timestamps null: false
    end
  end
end
