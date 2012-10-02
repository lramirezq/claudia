class AddAttachmentArchivoToDocumento < ActiveRecord::Migration
  def self.up
    add_column :documentos, :archivo_file_name, :string
    add_column :documentos, :archivo_content_type, :string
    add_column :documentos, :archivo_file_size, :integer
    add_column :documentos, :archivo_updated_at, :datetime
  end

  def self.down
    remove_column :documentos, :archivo_file_name
    remove_column :documentos, :archivo_content_type
    remove_column :documentos, :archivo_file_size
    remove_column :documentos, :archivo_updated_at
  end
end
