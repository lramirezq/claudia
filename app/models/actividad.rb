class Actividad < ActiveRecord::Base
  belongs_to :fase
  validates_presence_of :nombre
end
