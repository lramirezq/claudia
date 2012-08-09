class AddProyectoIdToFases < ActiveRecord::Migration
  def self.up
    add_column :fases, :proyecto_id, :integer
  end

  def self.down
    remove_colum :fases, :proyecto_id, :integer
  end
end
