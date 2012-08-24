class AddProyectoidToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :proyecto_id, :integer
  end

  def self.down
    remove_colum :users, :proyecto_id, :integer
  end
end
