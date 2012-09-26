class Fase < ActiveRecord::Base
   belongs_to :proyecto
   has_many :actividads, :dependent => :destroy
   has_many :archivos, :dependent => :destroy
   accepts_nested_attributes_for :actividads, :allow_destroy => true
   accepts_nested_attributes_for :archivos, :allow_destroy => true
   validates_presence_of :nombre
   
end
