class SessionsController < ApplicationController
  include SessionHelper
  
  def new; end

  def create
    user = type.constantize.find_by(email: email)
    log(user)
  end
  
  def login_employee
    employee = type.constantize.find_by(login: login)
    log(employee)
  end
  
  def login_reader
    reader = Reader.find_by(login: login)
    log(reader)
  end
  
  def login_admin
    admin = Admin.find_by(login: login)
    log(admin)
  end

  def destroy
    log_out
    redirect_to root_path, notice: "Wylogowano, zapraszamy ponownie"
    # redirect_to root_path
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
    
    binding.pry
    user && user.authenticate(pass)
  end

  def log(user)
    if correct?(user)
      log_in(user)
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Zalogowano!" }
      end
      
    else
      redirect_to root_path, notice: "Niewłaściwy login lub hasło"
    end
  end
end
