class AddProductsUsersTable < ActiveRecord::Migration
  def self.up
    create_table :products_users, :id => false do |t|
      t.references :product
      t.references :user
    end
  end

  def self.down
    drop_table :products_users
  end
end