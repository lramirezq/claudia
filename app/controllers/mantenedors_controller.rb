# -*- coding: utf-8 -*-
class MantenedorsController < ApplicationController
  
  # cancan
  load_and_authorize_resource

  # GET /mantenedors
  # GET /mantenedors.xml
  def index
    @mantenedors = paginamiento Mantenedor.search(params[:search])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mantenedors }
    end
  end

  # GET /mantenedors/1
  # GET /mantenedors/1.xml
  def show
    ### cancan lo carga
    ### @mantenedor = Mantenedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mantenedor }
    end
  end

  # GET /mantenedors/new
  # GET /mantenedors/new.xml
  def new
    ### cancan lo carga
    ### @mantenedor = Mantenedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mantenedor }
    end
  end

  # GET /mantenedors/1/edit
  def edit
    @mantenedor = Mantenedor.find(params[:id])
  end

  # POST /mantenedors
  # POST /mantenedors.xml
  def create
    ### cancan lo carga
    ### @mantenedor = Mantenedor.new(params[:mantenedor])

    respond_to do |format|
      if @mantenedor.save
        format.html { redirect_to(@mantenedor, :notice => 'Parámetro ha sido creado correctamente.') }
        format.xml  { render :xml => @mantenedor, :status => :created, :location => @mantenedor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mantenedor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mantenedors/1
  # PUT /mantenedors/1.xml
  def update
    ### cancan lo carga
    ### @mantenedor = Mantenedor.find(params[:id])

    respond_to do |format|
      if @mantenedor.update_attributes(params[:mantenedor])
        format.html { redirect_to(@mantenedor, :notice => 'Parámetro ha sido actualizado correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mantenedor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mantenedors/1
  # DELETE /mantenedors/1.xml
  def destroy
    ### cancan lo carga
    ### @mantenedor = Mantenedor.find(params[:id])
    @mantenedor.destroy

    respond_to do |format|
      format.html { redirect_to(mantenedors_url) }
      format.xml  { head :ok }
    end
  end
end
