class CreateMemTales < ActiveRecord::Migration
  def change
    create_table :mem_tales do |t|
      t.string :text
      t.string :title
      t.belongs_to :member, index: true
      
      t.timestamps null: false
    end
  end
end
