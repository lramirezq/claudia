# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # autenticación
  helper_method :current_user_session, :current_user
  
  # autorización
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Acceso denegado"
    session[:original_uri] = request.request_uri
    redirect_to root_path
  end
  
  # paginamiento
  helper_method :per_page
  @@default_per_page = 10
  
  # acortar palabras
  helper_method :shorten

  private
    def paginamiento(model)
      @per_page = params[:per_page] || cookies[:per_page] || @@default_per_page
      cookies[:per_page] = @per_page
      return model.paginate(:page => params[:page], :per_page => @per_page)
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def shorten(string, count=25)
      if string.length >= count
        shortened = string[0, count]
        splitted = shortened.split(/\s/)
        words = splitted.length
        splitted[0, words-1].join(" ") + ' …'
      else
        string
      end
    end
end
