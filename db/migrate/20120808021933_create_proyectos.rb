class CreateProyectos < ActiveRecord::Migration
  def self.up
    create_table :proyectos do |t|
      t.string :nombre
      t.datetime :fechainicio
      t.datetime :fechatermino
      t.string :ambiente

      t.timestamps
    end
  end

  def self.down
    drop_table :proyectos
  end
end
