# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employee_url(@employee), notice: 'Procownik został dodany.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_url(@employee), notice: 'Dane pracownika zostały zaktualizowane.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy

    redirect_to employees_url, notice: 'Usunięto pracownika.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:email, :haslo, :data_urodzenia, :imie, :nazwisko, :role_id)
  end
end
