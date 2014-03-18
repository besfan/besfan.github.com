class AddEmailToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :city, :string
  end

  def self.down
    remove_column :users, :city
    remove_column :users, :email
  end
end
