class AddFaseIdToActividades < ActiveRecord::Migration
  def self.up
    add_column :actividads, :fase_id, :integer
  end

  def self.down
    remove_column :actividads, :fase_id, :integer
  end
end
