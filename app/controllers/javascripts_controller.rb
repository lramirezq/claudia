# -*- coding: utf-8 -*-
class JavascriptsController < ApplicationController
  def comunas
    @comunas = Mantenedor.comunas
    @regiones = Mantenedor.regiones
    
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  
   def estaciones
    @estaciones = Mantenedor.estaciones
    
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  
  def victimas
    @victimas = Victima.where(:rut => params[:rut]).last()  
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  
  def imputados
    @imputados = Imputado.where(:rut => params[:rut]).last()  
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  
  def causas
    @victimas = Victima.where(:codigo => params[:codigo]).first 
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  
  
  def fiscalias
    @juzgados = Mantenedor.juzgados
    @fiscalias = Mantenedor.fiscalias
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

end
