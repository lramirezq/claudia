class Proyecto < ActiveRecord::Base
  has_many :fases
  has_many :actividades
end
