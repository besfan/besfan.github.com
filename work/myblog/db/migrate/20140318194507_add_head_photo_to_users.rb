class AddHeadPhotoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :head_photo, :string
    add_column :users, :sex, :string
    add_column :users, :birthday, :datetime
  end

  def self.down
    remove_column :users, :head_photo
    remove_column :users, :sex
    remove_column :users, :birthday
  end
end
