class Addcomentariostodocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :comentario, :string
  end

  def self.down
    remove_column :documentos, :comentario, :string
  end
end
