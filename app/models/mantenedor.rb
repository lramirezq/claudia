class Mantenedor < ActiveRecord::Base
 validates_presence_of :tipo, :valor
  def self.comunas
    Mantenedor.where(:tipo => :comuna).order(:id)
  end
  
  def self.regiones
    Mantenedor.where(:tipo => :region).order(:id)
  end
  
  def self.region(id)
    Mantenedor.where(:tipo => :region, :misc => id).first().valor
  end
  
  def self.lugarocurrencias
    Mantenedor.where(:tipo => :lugaroccurrencia).order(:id)
  end
  
  def self.tipovictimas
    Mantenedor.where(:tipo => :tipovictima).order(:id)
  end

  def self.cargovictimas
    Mantenedor.where(:tipo => :cargovictima).order(:id)
  end  
  
  def self.tipoidentificacions
    Mantenedor.where(:tipo => :tipoidentificacion).order(:id)
  end
  
  def self.tiposexos
    Mantenedor.where(:tipo => :tiposexo).order(:id)
  end
  
  def self.delitos
    Mantenedor.where(:tipo => :delito).order(:valor)
  end
  
  def self.lugares
    Mantenedor.where(:tipo => :lugar).order(:id)
  end
  
  def self.especies
    Mantenedor.where(:tipo => :especie).order(:id)
  end
  
  def self.detenciones
    Mantenedor.where(:tipo => :detencion).order(:id)
  end
  
  def self.tipoimputados
    Mantenedor.where(:tipo => :tipoimputado).order(:id)
  end
  
  def self.tipotestigos
    Mantenedor.where(:tipo => :tipotestigo).order(:id)
  end  
  
  def self.cargoimputados
    Mantenedor.where(:tipo => :cargoimputado).order(:id)
  end
  
  def self.lineas
    Mantenedor.where(:tipo => :linea).order(:id)
  end
  
  def self.estaciones
    Mantenedor.where(:tipo => :estacion).order(:id)
  end
  
  def self.mail_evento
    Mantenedor.where(:tipo => :mail_evento).order(:id)
  end
  
  def self.mail_causa
    Mantenedor.where(:tipo => :mail_causa).order(:id)
  end
  
  
  def self.mail_validacion
    Mantenedor.where(:tipo => :mail_validacion).order(:id)
  end
  
  
  def self.tipo_asistencias
    Mantenedor.where(:tipo => :tipo_asistencia).order(:id)
  end
  
  def self.valor_especies
    Mantenedor.where(:tipo => :valor_especie).order(:id)
  end
  
  def self.valor_especies
    Mantenedor.where(:tipo => :valor_especie).order(:id)
  end
  
  def self.tipo_servicios
    Mantenedor.where(:tipo => :tipo_servicio).order(:id)
  end
  
  
  def self.medio_contactos
    Mantenedor.where(:tipo => :medio_contacto).order(:id)
  end
  
  
  def self.servicio_prestados
    Mantenedor.where(:tipo => :servicio_prestado).order(:id)
  end
  
  def self.forma_inicios
    Mantenedor.where(:tipo => :forma_inicio).order(:id)
  end
  
  def self.comparece_gtc
    Mantenedor.where(:tipo => :comparece_gtc).order(:id)
  end
  
  def self.estado_causas
    Mantenedor.where(:tipo => :estado_causa).order(:id)
  end
  
  
  def self.termino_irregular
    Mantenedor.where(:tipo => :termino_irregular).order(:valor)
  end
  
  def self.termino_judicial
    Mantenedor.where(:tipo => :termino_judicial).order(:valor)
  end
  
  def self.suspension_condicional
    Mantenedor.where(:tipo => :suspension_condicional).order(:id)
  end
  
  def self.beneficios
    Mantenedor.where(:tipo => :beneficio).order(:valor)
  end
  
  def self.condenas
    Mantenedor.where(:tipo => :condena).order(:valor)
  end
  
  def self.sectores
    Mantenedor.where(:tipo => :sector).order(:id)
  end
  
  def self.fiscalias
    Mantenedor.where(:tipo => :fiscalia).order(:id)
  end
  
  def self.juzgados
    Mantenedor.where(:tipo => :juzgado).order(:id)
  end
  
  
  def self.tops
    Mantenedor.where(:tipo => :tribunalOralPenal).order(:id)
  end
  
  def comparencias
    Mantenedor.where(:tipo => :comparencias).order(:id)
  end
  def self.search(search)
   if search
      where(:tipo.matches => "%#{search}%")
    else
      all
    end
  end
  
  
end
