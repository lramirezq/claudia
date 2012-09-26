class Addcampostoarchivo < ActiveRecord::Migration
  def self.up
    add_column :archivos, :detalle, :string
    add_column :archivos, :valida, :boolean
  end

  def self.down
    remove_colum :archivos, :detalle, :string
    remove_colum :archivos, :valida, :boolean
  end
end
