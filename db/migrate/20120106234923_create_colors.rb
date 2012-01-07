class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex

      t.timestamps
    end
    
    remove_column :messages, :color
    add_column :messages, :color_id, :integer
  end
end
