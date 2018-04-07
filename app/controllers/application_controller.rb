class ApplicationController < ActionController::Base
before_action :authenticate_user!
  # protect_from_forgery with: :exception

  # protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery with: :null_session

  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json, :html
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token

  protected
    # def authenticate_current_user
    # head :unauthorized if get_current_user.nil?
  # end

  # def get_current_user
    # return nil unless cookies[:auth_headers]
    # auth_headers = JSON.parse(cookies[:auth_headers])

    # expiration_datetime = DateTime.strptime(auth_headers["expiry"], "%s")
    # current_user = User.find_by(uid: auth_headers["uid"])

    # if current_user &&
       # current_user.tokens.has_key?(auth_headers["client"]) &&
       # expiration_datetime > DateTime.now

      # @current_user = current_user
    # end
    # @current_user
  # end
  
  # def authenticated?
    # authenticate_or_request_with_http_basic {|username, password| User.where( email: username, password: password).present? }
  # end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_api_user
    super || Guest.new
  end

  def current_user
    super || Guest.new
  end
 end
