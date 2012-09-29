class Archivoidtofases < ActiveRecord::Migration
  def self.up
    add_column :fases, :archivo_id, :integer
  end

  def self.down
    remove_colum :fases, :archivo_id, :integer
  end
end
