class CreateProyectosUsers < ActiveRecord::Migration
  def self.up
    create_table :proyectos_users do |t|
      t.references :proyecto
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :proyectos_users
  end
end
