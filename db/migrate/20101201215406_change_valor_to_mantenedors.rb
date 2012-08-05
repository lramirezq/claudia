class ChangeValorToMantenedors < ActiveRecord::Migration
  def self.up
    change_column :mantenedors, :valor, :string, :limit => 1023
  end

  def self.down
    change_column :mantenedors, :valor, :string
  end
end
