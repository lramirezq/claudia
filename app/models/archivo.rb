class Archivo < ActiveRecord::Base
  belongs_to :fase
  has_attached_file :adjunto
  validates_presence_of :detalle
end
