class Documento < ActiveRecord::Base
  belongs_to :fase
  has_attached_file :archivo
  validates_attachment_presence :archivo
  validates_attachment_size :archivo, :less_than => 3.megabytes
end
