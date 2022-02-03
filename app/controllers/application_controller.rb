class ApplicationController < ActionController::Base
  include SessionHelper

  def current_user
    if session[:user_id]
      @current_user = session[:user_type].constantize.find_by(id: session[:user_id])
    end
    @current_user
  end
end
