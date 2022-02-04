Rails.application.routes.draw do

  root action: :home, controller: 'welcome'
  get 'help', action: :help, controller: 'welcome'
  get 'about', action: :about, controller: 'welcome'

  get 'login', action: :new, controller: 'sessions'
  post 'login', action: :create, controller: 'sessions'

  post 'log_out', action: :destroy, controller: 'sessions', as: :log_out

  scope 'czytelnik' do
    get 'moje_wypozyczenia', action: :rents, controller: 'readers', as: :readers_rents
  end


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
