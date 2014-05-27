class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def defualt_url_options
      { locale: I18n.locale }
    end

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :email
      devise_parameter_sanitizer.for(:sign_in) << :email
      devise_parameter_sanitizer.for(:account_update) << :email
    end
end
