class AddDescriptionToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :description, :string
  end

  def self.down
    remove_column :projects, :description
  end
end
