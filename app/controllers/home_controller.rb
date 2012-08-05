# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  
  # página de inicio
  def index
    if not current_user
      puts "Llegue aqui !"
      @user_session = UserSession.new
      puts "Genere instancia User !"
    end
  end

  # inicio sesión
  def logon
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = 'Inicio de sesión con éxito'
      uri = session[:original_uri]
      session[:original_uri] = nil
      if uri
        redirect_to uri
      else
        redirect_to root_path
      end
    else
      render :action => 'index'
    end
  end

  # termino sesión
  def logoff
    if current_user
      current_user_session.destroy
      flash[:notice] = 'Termino de sesión con éxito'
    end
    redirect_to root_path
  end
  
  # cambio de clave
  def password
    if not current_user
      redirect_to root_path
    end
    @user = current_user
    if params[:password] and not params[:password].empty?
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      if @user.save
        flash[:notice] = 'Cambio de clave exitoso'
        redirect_to root_path
      else
        render :action => :password
      end
    end
  end
end
