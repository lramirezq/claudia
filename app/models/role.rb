class Role < ActiveRecord::Base
  has_many :userroles
  has_many :users, :through => :userroles
  
  validates :nombre, :presence => true
  validates :nombre, :uniqueness => true
end
