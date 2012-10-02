class AddAttachmentArchivoToFile < ActiveRecord::Migration
  def self.up
    add_column :files, :archivo_file_name, :string
    add_column :files, :archivo_content_type, :string
    add_column :files, :archivo_file_size, :integer
    add_column :files, :archivo_updated_at, :datetime
  end

  def self.down
    remove_column :files, :archivo_file_name
    remove_column :files, :archivo_content_type
    remove_column :files, :archivo_file_size
    remove_column :files, :archivo_updated_at
  end
end
