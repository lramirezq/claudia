class CreateMantenedors < ActiveRecord::Migration
  def self.up
    create_table :mantenedors do |t|
      t.string :tipo
      t.string :valor
      t.string :misc

      t.timestamps
    end
  end

  def self.down
    drop_table :mantenedors
  end
end
