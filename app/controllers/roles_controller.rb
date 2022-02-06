# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :set_role

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def edit; end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to role_url(@role), notice: 'Stanowisko zostało dodane.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      redirect_to role_url(@role), notice: 'Zaktualizowano stanowisko.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy
    redirect_to roles_url, notice: 'Usunięto stanowisko.'
  end

  private

  def set_role
    @role = Role.find_by(id: params[:id])
  end

  def role_params
    params.require(:role).permit(:nazwa, :wyplata)
  end
end
