class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Adding more flash types for bootstrap styling (defaults- :alert, :notice)
  add_flash_types :danger, :warning, :success, :validation_errors

end
