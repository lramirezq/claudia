class Addrelacionfasesfiles < ActiveRecord::Migration
  def self.up
    add_column :fases, :file_id, :integer
    add_column :files, :fase_id, :integer
  end

  def self.down
    remove_colum :fases, :file_id, :integer
    remove_colum :files, :fase_id, :integer
  end
end
