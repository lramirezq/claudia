class AddUseridToProyecto < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :user_id, :integer
  end

  def self.down
    remove_colum :proyectos, :user_id, :integer
  end
end
