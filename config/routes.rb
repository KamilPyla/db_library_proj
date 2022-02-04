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

  scope 'wypozyczenia' do
    get 'czytelnik/:id', action: :readers_rents, controller: 'rents', as: :admin_readers_rents
    post 'przedluz/:id', action: :prelongate, controller: 'rents', as: :prelongate
  end

  scope 'kary' do
    get 'czytelnik/:id', action: :readers_punishments, controller: 'punishments', as: :admin_readers_punishments
    get 'dodaj/:id', action: :new_punishment, controller: 'readers', as: :add_punishment
    post 'dodaj/:id', action: :create_punishment, controller: 'readers', as: :create_punishment
  end

  scope 'ksiazki' do
    post 'wypozycz/:id', action: :rent, controller: 'books', as: :rent_book
    post 'return/:id', action: :return, controller: 'rents', as: :return_book
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
