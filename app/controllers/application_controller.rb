# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionHelper

  before_action :verify_user, only: %i[destroy edit]

  def current_user
    @current_user ||= session[:user_type].constantize.find_by(id: session[:user_id]) if session[:user_id]
  end

  def verify_user
    redirect_to root_path, notice: 'Jako czytelnik nie możesz wykowywać tych akcji!' if current_user.reader?
  end
end
