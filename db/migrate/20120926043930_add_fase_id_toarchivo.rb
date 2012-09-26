class AddFaseIdToarchivo < ActiveRecord::Migration
  def self.up
    add_column :fases, :achivo_id, :integer
  end

  def self.down
    remove_colum :fases, :achivo_id, :integer
  end
end
