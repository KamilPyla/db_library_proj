# frozen_string_literal: true

class SessionsController < ApplicationController
  USER_TYPE = { reader: 'Pracownik', employee: 'Czytelnik', admin: 'Administrator' }
  include SessionHelper

  def new; end

  def create
    user = type.constantize.find_by(email: email)
    log(user)
  end

  def log_out_user
    log_out
    redirect_to root_path, notice: 'Wylogowano, zapraszamy ponownie'
  end

  private

  def email
    @email ||= params[:session][:email]
  end

  def pass
    @pass ||= params[:session][:pass]
  end

  def type
    @type ||= params[:session][:type]
  end

  def correct?(user)
    user&.authenticate(pass)
  end

  def log(user)
    if correct?(user)
      log_in(user)
      redirect_to root_path, notice: log_in_notice
    else
      redirect_to login_path, notice: 'Niewłaściwy login lub hasło'
    end
  end

  def log_in_notice
    USER_TYPE[type]
  end
end
