class ApplicationController < ActionController::Base
  # before_action :set_variables
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_out_path_for(_resource_or_scope)
    auth_path
  end

  def authenticate_user!
    return if user_signed_in?

    current_uri = request.env['PATH_INFO']
    unless [auth_path, '/users/sign_in', '/users/sign_up', '/users/password/new',
            user_password_path].include?(current_uri)
      redirect_to auth_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :name)
    end
  end

  # def set_variables
  #   @current_user = current_user
  # end
end
