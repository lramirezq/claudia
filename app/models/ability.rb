class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # impide nil exception
    
    # aquí se definen los permisos por rol, formato es:
    # can :nombre_accion, ClaseModelo
    # acciones especiales
    #   :read     => leer?
    #   :manage   => todo
    # clases especiales
    #   :all      => cualquier clase
    # casos especiales, ver http://railscasts.com/episodes/192-authorization-with-cancan
    
    if user.role? :administrador
      can :manage, User
      can :manage, Mantenedor
      can :manage, Proyecto
      #Permisos para busquedas
        
    end
    
    
  end
end