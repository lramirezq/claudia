class AddEstadoToActividades < ActiveRecord::Migration
  def self.up
    add_column :actividads, :estado, :boolean
  end

  def self.down
    remove_colum :actividads, :estado, :boolean
  end
end
