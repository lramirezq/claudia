# -*- coding: utf-8 -*-
class ProyectosController < ApplicationController
    load_and_authorize_resource
  # GET /proyectos
  # GET /proyectos.xml
  def index
     @action = "index"
     
    @proyectos = paginamiento Proyecto.all(:order => "id DESC")
    cod = params[:search]
    us = params[:user]
  
    if cod !=nil && !cod.empty?
       @proyectos = paginamiento Proyecto.where(:nombre.matches => "%#{cod}%") 
    end
    
    
    if us !=nil && !us.empty?
      @proyectos.each do |proyecto|
        a = 0
        proyecto.users.each do |u|
          if u.nombre.upcase.include?us.upcase
            puts "Esto viene " + u.nombre.upcase + " coincide con " + us.upcase + "proyecto => " + proyecto.id.to_s
          a = 1  
          end
        end
        if (a==0)
          @proyectos.delete(proyecto)
        end
    end
  end
    
   

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proyectos }
    end
  end

  # GET /proyectos/1
  # GET /proyectos/1.xml
  def show
     @action = "show"
    @proyecto = Proyecto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proyecto }
    end
  end

  # GET /proyectos/new
  # GET /proyectos/new.xml
  def new
     @action = "new"
    @proyecto = Proyecto.new
    @users = User.all
    #Template
    @fase = Fase.new
    @fase.nombre = "Fase Análisis"
    @fase1 = Fase.new
    @fase1.nombre = "Fase Diseño"
    @fase2 = Fase.new
    @fase2.nombre = "Fase Ejecución"
    @fase3 = Fase.new
    @fase3.nombre = "Cierre"
    @fase4 = Fase.new
    @fase4.nombre = "Aceptación (opcional)"
    #Actividades
    @a = Actividad.new
    @a.nombre = "Entrega de Requerimientos de Sistema"
    @a1 = Actividad.new
    @a1.nombre = "Análisis de  funcionalidades"
    @a2 = Actividad.new
    @a2.nombre = "Estimación preliminar de esfuerzo"
    @a3 = Actividad.new
    @a3.nombre = "Creación documento de requerimientos DORE"
    @a4 = Actividad.new
    @a4.nombre = "Validación del documento de requerimientos funcionales"
    @a5 = Actividad.new
    @a5.nombre = "Reunión de término de fase"




    #Construyendo Fases 
    @proyecto.fases[0] = @fase
    @proyecto.fases[0].actividads[0]=@a
    @proyecto.fases[0].actividads[1]=@a1
    @proyecto.fases[0].actividads[2]=@a2
    @proyecto.fases[0].actividads[3]=@a3
    @proyecto.fases[0].actividads[4]=@a4
    @proyecto.fases[0].actividads[5]=@a5
    @proyecto.fases[1] = @fase1
    @a = Actividad.new
    @a.nombre = "Creación de Plan de Pruebas"
    @a1 = Actividad.new
    @a1.nombre = "Preparación de ambiente y datos de prueba"
    @a2 = Actividad.new
    @a2.nombre = "Validación del Plan de pruebas"
    @a3 = Actividad.new
    @a3.nombre = "Reunión de término de fase"
    @proyecto.fases[1].actividads[0]=@a
    @proyecto.fases[1].actividads[1]=@a1
    @proyecto.fases[1].actividads[2]=@a2
    @proyecto.fases[1].actividads[3]=@a3
    @proyecto.fases[2] = @fase2
    @a = Actividad.new
    @a.nombre = "Ejecución de pruebas - Ciclo 1"
    @a1 = Actividad.new
    @a1.nombre = " Seguimiento de incidentes"
    @a2 = Actividad.new
    @a2.nombre = "Validación del informe de avance e incidentes"
    @a3 = Actividad.new
    @a3.nombre = "Reunión de término de fase"
    @proyecto.fases[2].actividads[0]=@a
    @proyecto.fases[2].actividads[1]=@a1
    @proyecto.fases[2].actividads[2]=@a2
    @proyecto.fases[2].actividads[3]=@a3
    @proyecto.fases[3] = @fase3
    @a = Actividad.new
    @a.nombre = "Cierre / Conclusión del proyecto"
    @a1 = Actividad.new
    @a1.nombre = "Presentación de resultados"
    @a2 = Actividad.new
    @a2.nombre = "Validación de los entregables de Cierre"
    @a3 = Actividad.new
    @a3.nombre = "Reunión de término de fase"
    @proyecto.fases[3].actividads[0]=@a
    @proyecto.fases[3].actividads[1]=@a1
    @proyecto.fases[3].actividads[2]=@a2
    @proyecto.fases[3].actividads[3]=@a3
    @proyecto.fases[4] = @fase4
    @a = Actividad.new
    @a.nombre = "Pruebas de Aceptación del Usuario"
    @a1 = Actividad.new
    @a1.nombre = "Validación del informe de incidencias"
    @a2 = Actividad.new
    @a2.nombre = "Reunión de término de fase"
    @proyecto.fases[4].actividads[0]=@a
    @proyecto.fases[4].actividads[1]=@a1
    @proyecto.fases[4].actividads[2]=@a2
    @totalPorcentaje = 98
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proyecto }
    end
  end

  # GET /proyectos/1/edit
  def edit
    @proyecto = Proyecto.find(params[:id])
    @action = "edit"
  end

  # POST /proyectos
  # POST /proyectos.xml
  def create
    @proyecto = Proyecto.new(params[:proyecto])
 
    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to(@proyecto, :notice => 'Proyecto fue creado exitosamente.') }
        format.xml  { render :xml => @proyecto, :status => :created, :location => @proyecto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proyecto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proyectos/1
  # PUT /proyectos/1.xml
  def update
    @proyecto = Proyecto.find(params[:id])
     @action = "update"
    respond_to do |format|
      if @proyecto.update_attributes(params[:proyecto])
        format.html { redirect_to(@proyecto, :notice => 'Proyecto fue actualizado correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proyecto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.xml
  def destroy
     @action = "delete"
    @proyecto = Proyecto.find(params[:id])
    @proyecto.destroy

    respond_to do |format|
      format.html { redirect_to(proyectos_url) }
      format.xml  { head :ok }
    end
  end
  
 
end
