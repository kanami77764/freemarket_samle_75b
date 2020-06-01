class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Exception, with: :rescue_from_exception

#  #エラー発生時にトップページに戻る。完成時に実施する！
#   def rescue_from_exception(e)
#   @exception = e 
#   redirect_to root_path
#   end 
  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end