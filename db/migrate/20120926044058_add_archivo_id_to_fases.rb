class AddArchivoIdToFases < ActiveRecord::Migration
  def self.up
    add_column :archivos, :fase_id, :integer
  end

  def self.down
    remove_colum :archivos, :fase_id, :integer
  end
end
