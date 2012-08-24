class Proyecto < ActiveRecord::Base
  has_many :fases, :dependent => :destroy
  has_many :proyectos_users
  has_many :users, :through => :proyectos_users
  
  accepts_nested_attributes_for :fases, :allow_destroy => true
  validates_presence_of :nombre, :fechainicio, :ambiente
  
end
