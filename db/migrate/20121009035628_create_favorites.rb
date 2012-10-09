class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites, :force => true do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :favorites, [:user_id, :product_id], :unique => true
  end

  def self.down
    drop_table :favorites
  end
end