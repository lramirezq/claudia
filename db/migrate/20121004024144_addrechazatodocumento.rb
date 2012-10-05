class Addrechazatodocumento < ActiveRecord::Migration
  def self.up
    add_column :documentos, :rechaza, :boolean
  end

  def self.down
    remove_column :documentos, :rechaza, :boolean
  end
end
