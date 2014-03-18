class AddPictureToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :picture_url, :string
  end

  def self.down
    remove_column :posts, :picture_url
  end
end
