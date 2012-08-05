class DelitoSecundario < ActiveRecord::Base
  belongs_to :evento
 # validates_presence_of :evento_id, :orden, :nombre
end
