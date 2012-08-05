class CreateUserroles < ActiveRecord::Migration
  def self.up
    create_table :userroles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :userroles
  end
end
