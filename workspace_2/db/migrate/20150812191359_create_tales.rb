class CreateTales < ActiveRecord::Migration
  def change
    create_table :tales do |t|
      t.string :title
      t.string :text
      t.string :image

      t.timestamps null: false
    end
  end
end
