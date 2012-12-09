class CreateHistorias < ActiveRecord::Migration
  def self.up
    create_table :historias do |t|
      t.string :user
      t.string :action
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :historias
  end
end
