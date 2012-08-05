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
      #Permisos para busquedas
      can :evento, Report
      can :victima, Report
      can :imputado, Report
      
    end
    
    if user.role? :ccs
      # crear evento
      can :create, Evento
      #can :export, Evento
      # listar eventos
      can :index, Evento
      # ver evento
      can :read, Evento, :estado => 'CREADO'
      # editar/actualizar evento si está en estado creado
      can :update, Evento, :estado => 'CREADO'
    end
    
    if user.role? :procurador_gtc
      # listar eventos
      can :index, Evento
      # ver evento
      can :read, Evento
      # actualizar evento si no ha sido validado 
      # FIXME: ¿dejar esto en otro método?
      can :update, Evento #, :estado => 'CREADO'
      # validar evento si no ha sido validado
      can :validate, Evento, :estado => 'CREADO'
      # revisión y edicion de asistencia 24/7
      can :manage, Asistencia
      
      #Permisos para busquedas
      can :evento, Report
      can :victima, Report
      can :imputado, Report
      can :export_atencion, Evento
    end
    
    # Atención cliente puede administrar los contactos de Victimas e Imputados
    if user.role? :atencion_gtc
      can :manage, Victima
      can :manage, Imputado
      can :manage, Contacto
    end

    # Atención cliente puede administrar los contactos de Victimas e Imputados
    if user.role? :atencion_metro
      can :manage, Victima
      can :manage, Imputado
      can :manage, Contacto
    end
    
    # Abogados pueden crear nuevas causas y crear tramites y tambien cerrarlas
    if user.role? :abogado_gtc
      
      can :index, Causa
      can :manage, Causa
      can :manage, Tramite
      can :manage, InformeCausaTerminada
      can :manage, InformeVictima
      # revisión y edicion de asistencia 24/7
      can :manage, Asistencia
      
      #Permisos para busquedas
      can :evento, Report
      can :victima, Report
      can :imputado, Report
      can :export_atencion, Evento

    end
    
    if user.role? :abogado_metro
      can :read, Evento
      # Puede Ver Asistencias solicitadas
      can :read, Asistencia
      can :read, Causa
      can :update, Causa
      # validar evento si no ha sido validado
      can :validate, Causa, :estado => 'Terminada', :estado1 => 'CREADA'
      can :manage, Tramite
      can :manage, InformeCausaTerminada
      can :manage, InformeVictima
      can :read, Victima
      can :read, Imputado
      can :read, Contacto
      #Permisos para busquedas
      can :evento, Report
      can :victima, Report
      can :imputado, Report
      can :export_atencion, Evento
    end
    
    if user.role? :seguridad_metro
      # validar evento si no ha sido validado
      can :index, Evento
      can :read, Evento
      can :export, Evento
      can :read, Causa
      can :read, Victima
      can :read, Imputado
      can :read, Contacto
      can :read, Asistencia
      #Permisos para busquedas
      can :evento, Report
      can :victima, Report
      can :imputado, Report
      can :informe_ejecutivo, Report
      can :export_atencion, Evento
    end
  end
end