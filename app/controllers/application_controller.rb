class ApplicationController < ActionController::Base
    before_action :set_locale
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
        { locale: I18n.locale }.merge options
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def after_sign_out_path_for(resource)
        new_user_session_path
    end
end
