class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :price
      t.timestamps
    end
  end
end
