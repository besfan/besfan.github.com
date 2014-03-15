class AddOtherToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :other, :text
  end

  def self.down
    remove_column :products, :other
  end
end
