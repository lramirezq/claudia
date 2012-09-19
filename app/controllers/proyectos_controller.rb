class ProyectosController < ApplicationController
    load_and_authorize_resource
  # GET /proyectos
  # GET /proyectos.xml
  def index
    @proyectos = Proyecto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proyectos }
    end
  end

  # GET /proyectos/1
  # GET /proyectos/1.xml
  def show
    @proyecto = Proyecto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proyecto }
    end
  end

  # GET /proyectos/new
  # GET /proyectos/new.xml
  def new
    @proyecto = Proyecto.new
    @users = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proyecto }
    end
  end

  # GET /proyectos/1/edit
  def edit
    @proyecto = Proyecto.find(params[:id])
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
    @proyecto = Proyecto.find(params[:id])
    @proyecto.destroy

    respond_to do |format|
      format.html { redirect_to(proyectos_url) }
      format.xml  { head :ok }
    end
  end
  
  def adduser
    @proyectos = Proyecto.all
    @usuarios = User.all
    puts "Aqui pase !"
  
     respond_to do |format|
        format.html 
        format.xml  { head :ok }
      end
  end
end
