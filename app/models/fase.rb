class Fase < ActiveRecord::Base
   belongs_to :proyecto
   has_many :actividads, :dependent => :destroy
   has_many :documentos, :dependent => :destroy
   accepts_nested_attributes_for :actividads, :allow_destroy => true
   accepts_nested_attributes_for :documentos, :allow_destroy => true
   validates_presence_of :nombre
   
end
