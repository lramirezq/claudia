class ProyectosUser < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :user
end
