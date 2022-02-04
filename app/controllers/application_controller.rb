# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionHelper

  def current_user
    @current_user ||= session[:user_type].constantize.find_by(id: session[:user_id]) if session[:user_id]
  end
  
end
