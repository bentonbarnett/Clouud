class AddColorColumnToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :color, :string
  end

  def self.down
    remove_column :messages, :color
  end
end
