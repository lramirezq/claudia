class Proyecto < ActiveRecord::Base
  has_many :fases, :dependent => :destroy
  accepts_nested_attributes_for :fases, :allow_destroy => true
  validates_presence_of :nombre, :fechainicio
end
