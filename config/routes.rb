Rails.application.routes.draw do

  root action: :home, controller: 'welcome'
  get 'help', action: :help, controller: 'welcome'
  get 'about', action: :about, controller: 'welcome'
  get 'login', action: :login, controller: 'welcome'

  scope 'login' do
    get 'new', action: :new, controller: 'sessions', as: :new_login
    post 'user', action: :create, controller: 'sessions', as: :login_user
    post 'reader', action: :login_reader, controller: 'sessions', as: :login_reader
    post 'employee', action: :login_employee, controller: 'sessions', as: :login_employee
    post 'admin', action: :login_admin, controller: 'sessions', as: :login_admin
  end

  post 'log_out', action: :destroy, controller: 'sessions', as: :log_out


  resources :rents
  resources :publishers
  resources :punishments
  resources :books
  resources :roles
  resources :employees
  resources :readers
  resources :categories
  resources :autors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
