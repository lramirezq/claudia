class AddProyectosToHistoria < ActiveRecord::Migration
  def self.up
    add_column :historias, :proyecto_id, :integer
    add_column :proyectos, :historia_id, :integer
  end

  def self.down
    remove_column :historias, :proyecto_id, :integer
    remove_column :proyectos, :historia_id, :integer
  end
end
