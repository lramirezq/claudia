class CreateFases < ActiveRecord::Migration
  def self.up
    create_table :fases do |t|
      t.string :nombre
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :fases
  end
end
