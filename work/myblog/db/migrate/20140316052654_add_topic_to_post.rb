class AddTopicToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :topic, :string
  end

  def self.down
    remove_column :posts, :topic
  end
end
