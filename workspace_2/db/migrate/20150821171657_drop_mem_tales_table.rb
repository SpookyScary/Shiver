class DropMemTalesTable < ActiveRecord::Migration
  def change
    drop_table :mem_tales
  end
end
