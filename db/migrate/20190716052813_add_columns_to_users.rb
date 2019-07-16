class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_id, :text
    add_column :users, :intro, :text
  end
end
