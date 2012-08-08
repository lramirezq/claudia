class CreateActividads < ActiveRecord::Migration
  def self.up
    create_table :actividads do |t|
      t.string :nombre
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :actividads
  end
end
