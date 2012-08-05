class ReportsController < ApplicationController
  load_and_authorize_resource
  # GET /reports
  # GET /reports.xml
  @eve = 0
  def evento
    #Recibo Parametros
    cod = params[:codigoEvento]
    
    if cod !=nil && !cod.empty?
      puts "Codigo ***************" + cod + "*********************"
    end
    linea = params[:linea]
    
    if linea !=nil && !linea.empty?
      puts "Linea ***************" + linea + "*********************"
    end
    estacion = params[:estacion]
    
    if estacion !=nil && !estacion.empty?
      puts "Estacion ***************" + estacion + "*********************"
    end
    
    fecini = params[:fechaOcurrencia1]
    
    if fecini !=nil && !fecini.empty?
      fecini = fecini[0,10]
      puts "fecini ***************" + fecini + "*********************"
    end
    
    fecter = params[:fechaOcurrencia2]
    
    if fecter !=nil && !fecter.empty?
      fecter = fecter[0,10]
      puts "fecter ***************" + fecter + "*********************"
    end
    
    fecval = params[:fechaValidacion]
    if fecval !=nil && !fecval.empty?
      fecval = fecval[0,10]
      puts "fecval ***************" + fecval + "*********************"
    end
    
    rutval = params[:rutValidador]
    if rutval !=nil && !rutval.empty?
      puts "rutval ***************" + rutval + "*********************"
    end
    
    lugar = params[:lugarOcurrencia]
    if lugar !=nil && !lugar.empty?
      puts "lugar ***************" + lugar + "*********************"
    end
    
      
    estado = params[:estado]
    if estado !=nil && !estado.empty?
      puts "estado ***************" + estado + "*********************"
    end
    
    
    delito = params[:delitoPrincipal]
    if delito !=nil && !delito.empty?
      puts "delito ***************" + delito + "*********************"
    end
    
    
    especie = params[:especie]
    if especie !=nil && !especie.empty?
      puts "especie ***************" + especie + "*********************"
    end
    
    
    valor = params[:valorEspecie]
    if valor !=nil && !valor.empty?
      puts "valor ***************" + valor + "*********************"
    end
    
    detencion = params[:detalleDetencion]
    if detencion !=nil && !detencion.empty?
      puts "detencion ***************" + detencion + "*********************"
    end
    
    

    com = '"'
    
    
    
    #Busca Rangos de Fecha Todos !
    if (fecini !=nil && !fecini.empty?) && (fecter !=nil && !fecter.empty?) && (fecval != nil && !fecval.empty?)
      puts "Las 2 Fechas vienen con datos !! " + "Fecha Ini : " + fecini + "Fecha Ter "+ fecter + "fecval "+ fecval
      #Contruyendo la Query Completa
      
      query = "select * from eventos
      where "+ com + "codigoEvento" + com + " ilike ? 
      and linea ilike ? 
      and estacion ilike ? 
      and to_char(" + com +"fechaOcurrencia"+ com +",'yyyy-mm-dd')  BETWEEN ? AND ?   
      and to_char(" +com + "fechaValidacion" + com +",'yyyy-mm-dd') ilike ?
      and "+com+"rutValidador"+com+" ilike ? 
      and " + com + "lugarOcurrencia" +com+" ilike ? 
      and estado ilike ?  
      and " + com + "delitoPrincipal" + com+" ilike ?
      and especie ilike ? 
      and " +com +"valorEspecie"+com+" ilike ?
      and "+ com + "detalleDetencion"+com +" ilike ?"
      puts query 
      
      
      @eventos = Evento.find_by_sql [query,
        "%#{cod}%", 
        "%#{linea}%",
        "%#{estacion}%",
        "#{fecini}",
        "#{fecter}",
        "#{fecval}",
        "%#{rutval}%",
        "%#{lugar}%",
        "%#{estado}%",
        "%#{delito}%",
        "%#{especie}%",
        "%#{valor}%",
        "%#{detencion}%"
        ]
        @eve = 1
      end
  
      #Segundo caso
      #Sin fecha de termino ni fecha de validacion
      if (fecini !=nil && !fecini.empty?) && (fecter ==nil || fecter.empty?) &&  (fecval ==nil || fecval.empty?)
      puts "No viene Fecha de Termino ni Fecha de Validacion"
      #Contruyendo la Query Completa
      
      query = "select * from eventos
      where "+ com + "codigoEvento" + com + " ilike ? 
      and linea ilike ? 
      and estacion ilike ? 
      and to_char(" + com +"fechaOcurrencia"+ com +",'yyyy-mm-dd')  ilike ?
      and "+com+"rutValidador"+com+" ilike ? 
      and " + com + "lugarOcurrencia" +com+" ilike ? 
      and estado ilike ?  
      and " + com + "delitoPrincipal" + com+" ilike ?
      and especie ilike ? 
      and " +com +"valorEspecie"+com+" ilike ?
      and "+ com + "detalleDetencion"+com +" ilike ?"
      puts query 
      
      
      @eventos = Evento.find_by_sql [query,
        "%#{cod}%", 
        "%#{linea}%",
        "%#{estacion}%",
        "#{fecini}",
        "%#{rutval}%",
        "%#{lugar}%",
        "%#{estado}%",
        "%#{delito}%",
        "%#{especie}%",
        "%#{valor}%",
        "%#{detencion}%"
        ]
        @eve = 2
      end
  
      #tercer caso
      #solo viene fecha de validacion
  
      if (fecini ==nil || fecini.empty?) && (fecter ==nil || fecter.empty?) && (fecval != nil && !fecval.empty?)
      puts "Solo viene Fecha de Validacion"
      #Contruyendo la Query Completa
      
      query = "select * from eventos
      where "+ com + "codigoEvento" + com + " ilike ? 
      and linea ilike ? 
      and estacion ilike ? 
      and to_char(" +com + "fechaValidacion" + com +",'yyyy-mm-dd') ilike ?
      and "+com+"rutValidador"+com+" ilike ? 
      and " + com + "lugarOcurrencia" +com+" ilike ? 
      and estado ilike ?  
      and " + com + "delitoPrincipal" + com+" ilike ?
      and especie ilike ? 
      and " +com +"valorEspecie"+com+" ilike ?
      and "+ com + "detalleDetencion"+com +" ilike ?"
      puts query 
      
      
      @eventos = Evento.find_by_sql [query,
        "%#{cod}%", 
        "%#{linea}%",
        "%#{estacion}%",
        "#{fecval}",
        "%#{rutval}%",
        "%#{lugar}%",
        "%#{estado}%",
        "%#{delito}%",
        "%#{especie}%",
        "%#{valor}%",
        "%#{detencion}%"
        ]
      @eve = 3
      end
  
      #Cuarto Caso sin Fechas  
  
      if (fecini ==nil || fecini.empty?) && (fecter ==nil || fecter.empty?) && (fecval == nil || fecval.empty?)
      puts "Sin Fechas"
      #Contruyendo la Query Completa
      
      query = "select * from eventos
      where "+ com + "codigoEvento" + com + " ilike ? 
      and linea ilike ? 
      and estacion ilike ? 
      and " + com + "lugarOcurrencia" +com+" ilike ? 
      and estado ilike ?  
      and " + com + "delitoPrincipal" + com+" ilike ?
      and especie ilike ? 
      and " +com +"valorEspecie"+com+" ilike ?
      and "+ com + "detalleDetencion"+com +" ilike ?"
      puts query 
      
      
      @eventos = Evento.find_by_sql [query,
        "%#{cod}%", 
        "%#{linea}%",
        "%#{estacion}%",
        "%#{lugar}%",
        "%#{estado}%",
        "%#{delito}%",
        "%#{especie}%",
        "%#{valor}%",
        "%#{detencion}%"
        ]
      @eve = 4
      end
  
  #Busca Solo Inicio y Termino !
    if (fecini !=nil && !fecini.empty?) && (fecter !=nil && !fecter.empty?) 
      puts "Las 2 Fechas vienen con datos !! " + "Fecha Ini : " + fecini + "Fecha Ter "+ fecter + "fecval "+ fecval
      #Contruyendo la Query Completa
      
      query = "select * from eventos
      where "+ com + "codigoEvento" + com + " ilike ? 
      and linea ilike ? 
      and estacion ilike ? 
      and to_char(" + com +"fechaOcurrencia"+ com +",'yyyy-mm-dd')  BETWEEN ? AND ?   
      and " + com + "lugarOcurrencia" +com+" ilike ? 
      and estado ilike ?  
      and " + com + "delitoPrincipal" + com+" ilike ?
      and especie ilike ? 
      and " +com +"valorEspecie"+com+" ilike ?
      and "+ com + "detalleDetencion"+com +" ilike ?"
      puts query 
      
      
      @eventos = Evento.find_by_sql [query,
        "%#{cod}%", 
        "%#{linea}%",
        "%#{estacion}%",
        "#{fecini}",
        "#{fecter}",
        "%#{lugar}%",
        "%#{estado}%",
        "%#{delito}%",
        "%#{especie}%",
        "%#{valor}%",
        "%#{detencion}%"
        ]
        @eve = 1
      end
  
  
      
      
    respond_to do |format|
      format.html # eventos.html.erb
      format.xml  { render :xml => @reports }
    end
  end
  
  
  def export_evento
    headers['Content-type'] = "application/ms-excel; charset=UTF8"
    headers['Content-Disposition'] = "attachment; filename=report-eventos.xls"
    headers['Pragma'] = "no-cache"
    headers['Expires'] = "0"
    @eventos = @eve
    respond_to do |format|
      format.html { render :layout => nil }
      format.xml  { head :ok }
    end
  end
  
  def victima
    #recibo parámetros
    tip_iden = params[:tipoidentificacion]
    rut = params[:rut]
    tipovic = params[:tipovictima]
    nombres = params[:nombres]
    apellidos = params[:apellidos]
    cargo = params[:cargo]
    sexo = params[:sexo]
    edad = params[:edad]
        
    direc = params[:direccion]
    region = params[:region]
    comuna = params[:comuna]
    tel = params[:telefono]
    email = params[:email]
    otros = params[:otros]
    
    @victimas = Victima.where(:tipoidentificacion.matches => "%#{tip_iden}%", 
                              :rut.matches => "%#{rut}%", 
                              :tipo.matches => "#{tipovic}", 
                              :nombres.matches => "%#{nombres}%", 
                              :apellidos.matches => "%#{apellidos}%", 
                              
                              :sexo.matches => "%#{sexo}%",
                              :direccion.matches => "%#{direc}%",
                              :region.matches => "%#{region}%",
                              :comuna.matches => "%#{comuna}%",
                              :telefono.matches => "%#{tel}%",
                              :email.matches => "%#{email}%",
                              :otros.matches => "%#{otros}%")
    respond_to do |format|
      format.html # eventos.html.erb
      format.xml  { render :xml => @reports }
    end
  end 

  def imputado
    #recibo parámetros
    tip_iden = params[:tipoidentificacion]
    rut = params[:rut]
    tipovic = params[:tipoimputado]
    nombres = params[:nombres]
    apellidos = params[:apellidos]
    cargo = params[:cargo]
    sexo = params[:sexo]
    edad = params[:edad]
    apodo = params[:apodo]    
    pand = params[:pandilla]
    direc = params[:direccion]
    region = params[:region]
    comuna = params[:comuna]
    tel = params[:telefono]
    email = params[:email]
    otros = params[:otros]
    
    @imputados = Imputado.where(:tipoidentificacion.matches => "%#{tip_iden}%", 
                              :rut.matches => "%#{rut}%", 
                              :tipo.matches => "#{tipovic}", 
                              :nombres.matches => "%#{nombres}%", 
                              :apellidos.matches => "%#{apellidos}%", 
                              :alias.matches => "%#{apodo}%", 
                              :pandilla.matches => "%#{pand}%", 
                              :sexo.matches => "%#{sexo}%",
                              :direccion.matches => "%#{direc}%",
                              :region.matches => "%#{region}%",
                              :comuna.matches => "%#{comuna}%",
                              :telefono.matches => "%#{tel}%",
                              :email.matches => "%#{email}%",
                              :otros.matches => "%#{otros}%")
    respond_to do |format|
      format.html # eventos.html.erb
      format.xml  { render :xml => @reports }
    end
  end
  
  def informe_ejecutivo
    @fecini = params[:fecini]
    @fecini = @fecini[0,10] unless @fecini.blank?

    @fecfin = params[:fecfin]
    @fecfin = @fecfin[0,10] unless @fecfin.blank?

    # parámetros gráfico
    size = '750x400'
    bgcolor = '00000000'
    rango = "#{@fecini} al #{@fecfin}"
    brcolor = '3366CC,CC3300,FF9900,009900,990099,0099CC,CC3366,669900,FFFF00,006666,333399,330000,99CC00,9966CC,FFCC00,CC6600,006699,FF3300,FF33CC,FF0000'

    # Eventos ingresados
    query = 'SELECT "delitoPrincipal" AS delito, count("delitoPrincipal") AS cantidad, 0 AS porcentaje
    FROM eventos
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    GROUP BY delito
    ORDER BY cantidad DESC'
    @eventos = Evento.find_by_sql [query, @fecini, @fecfin]

    @eventos_total = 0
    @eventos.map { |e| @eventos_total += e.cantidad.to_i }
    @eventos.map { |e| e.porcentaje = 100 * e.cantidad.to_i / @eventos_total }
    @eventos_chart = Gchart.pie(
        :size => size,
        :bg => bgcolor,
        :title => "Eventos Ingresados #{rango}",
        :data => @eventos.map { |e| e.cantidad.to_i },
        :labels => @eventos.map { |e| "#{e.porcentaje}% #{shorten(e.delito, 15)}" },
        :legend => @eventos.map { |e| "#{e.cantidad} #{shorten(e.delito, 20)}" },
        :bar_colors => brcolor)

    # Tipos de victima
    @totaldelitos = {}
    query = 'SELECT e."delitoPrincipal" as delitoprincipal, count(e.id) AS subtotal
    FROM eventos e, victimas v
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    AND e.id = v.evento_id
    GROUP BY delitoprincipal
    ORDER BY delitoprincipal'
    subtotaldelitos = Evento.find_by_sql [query, @fecini, @fecfin]
    subtotaldelitos.each do |x|
      @totaldelitos[x.delitoprincipal] = { 'TOTAL' => x.subtotal.to_i}
    end

    query = 'SELECT e."delitoPrincipal" AS delitoprincipal, v.tipo AS tipovictima, count(e.id) AS subtotal
    FROM eventos e, victimas v
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    AND e.id = v.evento_id
    GROUP BY delitoprincipal, tipovictima
    ORDER BY delitoprincipal, tipovictima'
    crucevictimasdelitos = Evento.find_by_sql [query, @fecini, @fecfin]
    crucevictimasdelitos.each do |x|
      @totaldelitos[x.delitoprincipal][x.tipovictima] = x.subtotal.to_i
    end

    query = 'SELECT v.tipo as tipovictima, count(e.id) AS subtotal
    FROM eventos e, victimas v
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    AND e.id = v.evento_id
    GROUP BY tipovictima
    ORDER BY tipovictima'
    subtotalvictimas = Evento.find_by_sql [query, @fecini, @fecfin]
    @totalvictimas = {}
    subtotalvictimas.each do |x|
      @totalvictimas[x.tipovictima] = x.subtotal.to_i
    end
    total = 0
    @totalvictimas.each { |k, v| total += v}

    data = @totalvictimas.map { |k| k[1] }
    labels = @totalvictimas.map { |k| "#{100 * k[1] / total}% #{shorten(k[0], 13)}" }
    legend = @totalvictimas.map { |k| "#{k[1]} #{shorten(k[0], 30)}" }
    @totalvictimas_chart = Gchart.pie(
        :size       => size,
        :bg         => bgcolor,
        :title      => "Tipos Victima #{rango}",
        :data       => data,
        :labels     => labels,
        :legend     => legend,
        :bar_colors => brcolor)
    @totalvictimas['TOTAL'] = total

    # Causas gestionadas
    query = 'SELECT c.estado AS estado, count(c.estado) AS cantidad, 0 AS porcentaje
    FROM victimas v
    INNER JOIN eventos e ON e.id = v.evento_id
    INNER JOIN causas c ON c.id = v.causa_id
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    GROUP BY c.estado
    ORDER BY cantidad DESC'
    @causas = Causa.find_by_sql [query, @fecini, @fecfin]
    @causas_total = 0
    @causas.map { |c| @causas_total += c.cantidad.to_i }
    @causas.map { |c| c.porcentaje = 100 * c.cantidad.to_i / @causas_total }

    # Término irregular
    query = 'SELECT "terminoIrregular" AS razon, count("terminoIrregular") AS cantidad, 0 AS porcentaje
    FROM victimas v
    INNER JOIN eventos e ON e.id = v.evento_id
    INNER JOIN causas c ON c.id = v.causa_id
    INNER JOIN informe_causa_terminadas i ON c.id = i.causa_id
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    AND "terminoIrregular" <> \'\'
    AND c.estado <> \'Pendiente\'
    AND "terminoIrregular" <> \'---------------------\'
    GROUP BY razon
    ORDER BY cantidad DESC'
    @terminoirregular = Causa.find_by_sql [query, @fecini, @fecfin]
    @terminoirregular_total = 0
    @terminoirregular.map { |c| @terminoirregular_total += c.cantidad.to_i }
    @terminoirregular.map { |c| c.porcentaje = 100 * c.cantidad.to_i / @terminoirregular_total }

    # Término fiscalía
    query = 'SELECT "terminoFiscalia" AS razon, count("terminoFiscalia") AS cantidad, 0 AS porcentaje
    FROM victimas v
    INNER JOIN eventos e ON e.id = v.evento_id
    INNER JOIN causas c ON c.id = v.causa_id
    INNER JOIN informe_causa_terminadas i ON c.id = i.causa_id
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    AND "terminoFiscalia" <> \'\'
    AND c.estado <> \'Pendiente\'
    AND "terminoFiscalia" <> \'---------------------\'
    GROUP BY razon
    ORDER BY cantidad DESC'
    @terminofiscalia = Causa.find_by_sql [query, @fecini, @fecfin]
    @terminofiscalia_total = 0
    @terminofiscalia.map { |c| @terminofiscalia_total += c.cantidad.to_i }
    @terminofiscalia.map { |c| c.porcentaje = 100 * c.cantidad.to_i / @terminofiscalia_total }

    # Término judicial
    query = 'SELECT "terminoJucial" AS razon, count("terminoJucial") AS cantidad, 0 AS porcentaje
    FROM victimas v
    INNER JOIN eventos e ON e.id = v.evento_id
    INNER JOIN causas c ON c.id = v.causa_id
    INNER JOIN informe_causa_terminadas i ON c.id = i.causa_id
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    AND "terminoJucial" <> \'\'
    AND c.estado <> \'Pendiente\'
    AND "terminoJucial" <> \'---------------------\'
    GROUP BY razon
    ORDER BY cantidad DESC'
    @terminojudicial = Causa.find_by_sql [query, @fecini, @fecfin]
    @terminojudicial_total = 0
    @terminojudicial.map { |c| @terminojudicial_total += c.cantidad.to_i }
    @terminojudicial.map { |c| c.porcentaje = 100 * c.cantidad.to_i / @terminojudicial_total }

    # Total general
    @totalgeneral = @terminoirregular_total + @terminofiscalia_total + @terminojudicial_total

    # Detalle de condenas terminadas
    query = 'SELECT condena AS condena, count(condena) AS cantidad, 0 AS porcentaje
    FROM victimas v
    INNER JOIN eventos e ON e.id = v.evento_id
    INNER JOIN causas c ON c.id = v.causa_id
    INNER JOIN informe_causa_terminadas i ON c.id = i.causa_id
    WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
    AND condena <> \'\'
    AND condena <> \'---------------------\'
    GROUP BY condena
    ORDER BY cantidad DESC'
    @condenasterminadas = Causa.find_by_sql [query, @fecini, @fecfin]
    @condenasterminadas_total = 0
    @condenasterminadas.map { |c| @condenasterminadas_total += c.cantidad.to_i }
    @condenasterminadas.map { |c| c.porcentaje = 100 * c.cantidad.to_i / @condenasterminadas_total }

    data = @condenasterminadas.map { |c| c.cantidad.to_i }
    labels = @condenasterminadas.map { |c| "#{c.porcentaje}% #{shorten(c.condena, 15)}" }
    legend = @condenasterminadas.map { |c| "#{c.cantidad} #{shorten(c.condena, 20)}" }
    @condenasterminadas_chart = Gchart.pie(
        :size       => size,
        :bg         => bgcolor,
        :title      => "Condenas en causa terminadas #{rango}",
        :data       => data,
        :labels     => labels,
        :legend     => legend,
        :bar_colors => brcolor)

    # Detalle de condenas privativas de libertad
    query = 'SELECT t.beneficio AS beneficio, count(t.beneficio) AS cantidad, 0 AS porcentaje
    FROM (SELECT condena, beneficio, "detCondena"
          FROM victimas v
          INNER JOIN eventos e ON e.id = v.evento_id
          INNER JOIN causas c ON c.id = v.causa_id
          INNER JOIN informe_causa_terminadas i ON c.id = i.causa_id
          WHERE to_char("fechaOcurrencia", \'yyyy-mm-dd\') BETWEEN ? AND ?
          AND substring(condena, 1, 2) in (\'Pr\', \'Re\')
          AND condena <> \'\') as t
    GROUP BY beneficio
    ORDER BY cantidad DESC'
    @condenasprivativas = Causa.find_by_sql [query, @fecini, @fecfin]
    @condenasprivativas_total = 0
    @condenasprivativas.map { |c| @condenasprivativas_total += c.cantidad.to_i }
    @condenasprivativas.map { |c| c.porcentaje = 100 * c.cantidad.to_i / @condenasprivativas_total }

    data = @condenasprivativas.map { |c| c.cantidad.to_i }
    labels = @condenasprivativas.map { |c| "#{c.porcentaje}% #{shorten(c.beneficio, 15)}" }
    legend = @condenasprivativas.map { |c| "#{c.cantidad} #{shorten(c.beneficio, 20)}" }
    @condenasprivativas_chart = Gchart.pie(
        :size       => size,
        :bg         => bgcolor,
        :title      => "Condenas privativas de libertad #{rango}",
        :data       => data,
        :labels     => labels,
        :legend     => legend,
        :bar_colors => brcolor)
  end

  def ejecutivo

    fecini = params[:fechaOcurrencia1]
    
    if fecini !=nil && !fecini.empty?
      fecini = fecini[0,10]
      puts "fecini ***************" + fecini + "*********************"
    end
    
    fecter = params[:fechaOcurrencia2]
    
    if fecter !=nil && !fecter.empty?
      fecter = fecter[0,10]
      puts "fecter ***************" + fecter + "*********************"
    end
    
    com = '"'
    #Buscar Eventos
     query = "select " + com + "delitoPrincipal" + com + " as delito, count(" + com + "delitoPrincipal" + com + ") as cantidad from eventos 
     where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ? 
     group by " + com + "delitoPrincipal" + com     
      
      
      puts query 

      
      @eventos = Evento.find_by_sql [query,
        "#{fecini}",
        "#{fecter}"
        ]
        
      puts query 
          
    
    
      
      #Comenzamos a sacar los datos informe 2 tipos de victimas
      
      query1 = "select * from eventos  where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ? "
      @delitos = Mantenedor.where(:tipo => 'delito')
      @eventos1 = Evento.find_by_sql [query1,"#{fecini}",  "#{fecter}" ]
      graphics2 =  "select victimas.tipo, count(*) as cant from victimas
                    inner join eventos  on victimas.evento_id = eventos.id
                    where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ? 
                    group by victimas.tipo"
      @grafic = Evento.find_by_sql [graphics2,"#{fecini}",  "#{fecter}" ]      
        
      
      #informe 3 estado de causas de eventos 
      query2 = " select causas.estado, count(causas.estado) as cantidad from victimas
                 inner join eventos on victimas.evento_id = eventos.id
                 inner join causas on victimas.causa_id = causas.id
                 where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ? 
                 group by causas.estado"
      
      @cau = Causa.find_by_sql [query2,"#{fecini}",  "#{fecter}" ]  
      
      
      
      query3 = " select " + com + "terminoIrregular" + com + ", count(" + com + "terminoIrregular" + com + ") as cantidad
                 from victimas
                 inner join eventos on victimas.evento_id = eventos.id
                 inner join causas on victimas.causa_id = causas.id
                 inner join informe_causa_terminadas on causas.id = informe_causa_terminadas.causa_id
                 where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ?  
                 and " + com + "terminoIrregular" + com + "  <> '' and causas.estado <> 'Pendiente'  group by " + com + "terminoIrregular" + com + "" 
      @tirregular = Causa.find_by_sql [query3,"#{fecini}",  "#{fecter}" ]  
      
      
      query4 = " select " + com + "terminoFiscalia" + com + ", count(" + com + "terminoFiscalia" + com + ") as cantidad
                 from victimas
                 inner join eventos on victimas.evento_id = eventos.id
                 inner join causas on victimas.causa_id = causas.id
                 inner join informe_causa_terminadas on causas.id = informe_causa_terminadas.causa_id
                 where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ?  
                 and " + com + "terminoFiscalia" + com + " <> ''  and causas.estado <> 'Pendiente' group by " + com + "terminoFiscalia" + com + "" 
      
      @tfiscalia = Causa.find_by_sql [query4,"#{fecini}",  "#{fecter}" ]  
      
      
      
      
      query5 = " select " + com + "terminoJucial" + com + ", count(" + com + "terminoJucial" + com + ") as cantidad
                 from victimas
                 inner join eventos on victimas.evento_id = eventos.id
                 inner join causas on victimas.causa_id = causas.id
                 inner join informe_causa_terminadas on causas.id = informe_causa_terminadas.causa_id
                 where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ?  
                 and " + com + "terminoJucial" + com + " <> '' and causas.estado <> 'Pendiente' group by " + com + "terminoJucial" + com + "" 
      
      @tjucial = Causa.find_by_sql [query5,"#{fecini}",  "#{fecter}" ]  
      
      
      
      query6 = "select condena, count(condena) as cantidad 
                from victimas  inner join eventos on victimas.evento_id = eventos.id
                inner join causas on victimas.causa_id = causas.id
                inner join informe_causa_terminadas on causas.id = informe_causa_terminadas.causa_id
                where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ?                  
                and condena <> '' group by condena"
      
      @condenas = Causa.find_by_sql [query6,"#{fecini}",  "#{fecter}" ]  
      
      
      query7 = "select t.beneficio, count(t.beneficio) as cantidad from (
                select condena, beneficio , " + com + "detCondena" + com + 
                "from victimas inner join eventos on victimas.evento_id = eventos.id
                inner join causas on victimas.causa_id = causas.id
                inner join informe_causa_terminadas on causas.id = informe_causa_terminadas.causa_id
                where to_char(" + com + "fechaOcurrencia" + com + ",'yyyy-mm-dd') BETWEEN ? AND ?
                and substring(condena, 1,2)  in ('Pr','Re')
                and condena <> '' ) as t
                group by beneficio" 
      
      @condenas_efectivas = Causa.find_by_sql [query7,"#{fecini}",  "#{fecter}" ]  
      
      @fecini = fecini
      @fecter = fecter
      
    respond_to do |format|
      format.html # eventos.html.erb
      format.xml  { render :xml => @reports }
    end
  end
  
  
 end
