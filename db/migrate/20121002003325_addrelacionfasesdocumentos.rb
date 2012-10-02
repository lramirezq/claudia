class Addrelacionfasesdocumentos < ActiveRecord::Migration
  def self.up
     add_column :fases, :documento_id, :integer
     add_column :documentos, :fase_id, :integer
   end

   def self.down
     remove_colum :fases, :documento_id, :integer
     remove_colum :documentos, :fase_id, :integer
   end
end
