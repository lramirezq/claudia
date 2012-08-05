class EventoMailer < ActionMailer::Base
  default :from => "grupotc.testing@gmail.com"
  
  def registration_confirmation(evento, root_url)
    @evento = evento
    @root_url = root_url.to_s.gsub(/\/+$/, '')
    #attachments["metrosantiago.jpg"] = File.read("#{Rails.root}/public/images/metrosantiago.jpg")

    #Recibo destinos desde el mantenedor    
    @destinos = Mantenedor.mail_evento.collect {|d| d.valor}.join(', ')
    mail(:to => @destinos, :subject => "Evento Ingresado en SGLEA #{@evento.codigoEvento.to_s}")
  end
  
  def validacion_evento(evento, root_url)
    @evento = evento
    @root_url = root_url.to_s.gsub(/\/+$/, '')
    #attachments["metrosantiago.jpg"] = File.read("#{Rails.root}/public/images/metrosantiago.jpg")

    #Recibo destinos desde el mantenedor    
    @destinos = Mantenedor.mail_validacion.collect {|d| d.valor}.join(', ')
    mail(:to => @destinos, :subject => "Se ha Validado el Evento #{@evento.codigoEvento.to_s} en SGLEA ")
  end
  
  def registration_causa(causa, root_url)
    @causa = causa
    @root_url = root_url.to_s.gsub(/\/+$/, '')
    #attachments["metrosantiago.jpg"] = File.read("#{Rails.root}/public/images/metrosantiago.jpg")

    #Recibo destinos desde el mantenedor    
    @destinos = Mantenedor.mail_causa.collect {|d| d.valor}.join(', ')
    mail(:to => @destinos, :subject => "Causa Actualizada en SGLEA #{@causa.id.to_s}")
  end
end
