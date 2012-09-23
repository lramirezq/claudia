class AddEstadoToFases < ActiveRecord::Migration
  def self.up
    add_column :fases, :estado, :boolean
  end

  def self.down
    remove_colum :fases, :estado, :boolean
  end
end
