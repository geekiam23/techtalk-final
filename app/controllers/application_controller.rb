class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  # before_action :authenticate_user, except: [:new, :create]

  private

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_user
    super || Guest.new
  end
 end
