class AddProcentajeToProyecto < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :porcentaje, :integer
  end
  def self.down
    remove_colum :proyectos, :porcentaje, :integer
  end
end



