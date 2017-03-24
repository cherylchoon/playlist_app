class AddNewColumns < ActiveRecord::Migration
  def change
    add_column :songs, :songable_id, :integer
    add_column :songs, :songable_type, :string
  end
end
