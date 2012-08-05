class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :nombre

      t.timestamps
    end
    
    add_index   :roles, :nombre
  end

  def self.down
    drop_table :roles
  end
end
