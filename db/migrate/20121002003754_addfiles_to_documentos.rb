class AddfilesToDocumentos < ActiveRecord::Migration
  def self.up
      add_column :documentos, :detalle, :string
      add_column :documentos, :valida, :boolean
    end

    def self.down
      remove_colum :documentos, :detalle, :string
      remove_colum :documentos, :valida, :boolean
    end
end
