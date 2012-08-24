class User < ActiveRecord::Base
  acts_as_authentic
 
 
  has_many :proyectos_users
  has_many :proyectos, :through => :proyectos_users
  has_many :userroles
  has_many :roles, :through => :userroles
  
  def role_symbols
    roles.map do |role|
      role.nombre.underscore.tr(' ', '_').to_sym
    end
  end
  
  def role?(role)
    role_symbols.include? role
  end
end
