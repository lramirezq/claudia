class Archivo < ActiveRecord::Base
  belongs_to :fase
  has_attached_file :adjunto
  validates_presence_of :detalle
  validates_attachment_presence :adjunto
end
