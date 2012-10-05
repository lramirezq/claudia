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
      can :index, Proyecto
      can :create, Proyecto
      can :read, Proyecto
      can :show, Proyecto
    end
    
    if user.role? :usuario  
      can :manage, Documento
      can :validate, Proyecto    
      can :index, Proyecto
      can :update, Proyecto
      can :read, Proyecto
    end
    
    if user.role? :jefe_proyecto
      can :index, Proyecto
      can :read, Proyecto
      can :edit, Proyecto
      can :update, Proyecto
      can :destroy, Proyecto
    end
    
     if user.role? :tester
        can :index, Proyecto
        can :read, Proyecto
        can :edit, Proyecto
        can :update, Proyecto
        can :destroy, Proyecto
      end
      
    
    if user.role? :analista
      can :index, Proyecto
      can :read, Proyecto
      can :edit, Proyecto
      can :update, Proyecto
    end
    
  end
end