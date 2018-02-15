class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session # TODO: is this what I want?

  before_action :authenticate_user!, except: :home

  add_flash_types :error, :success # available flash types: notice, alert, error, success

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    added_attrs_login = [:username, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs_login
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end