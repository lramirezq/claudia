# -*- coding: utf-8 -*-
class JavascriptsController < ApplicationController
  def comunas
    @comunas = Mantenedor.comunas
    @regiones = Mantenedor.regiones
    
    respond_to do |format|
      format.js {render :layout => false}
    end
  end
  

  
  

end
