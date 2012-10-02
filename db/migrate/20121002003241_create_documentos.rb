class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :documentos
  end
end
