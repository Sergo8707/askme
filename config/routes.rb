Rails.application.routes.draw do

  # Это правило говорит: если пользователь заходит по адресу /,
  # направь его в контроллер users, действие index
  # Грубо говоря, на главной странице у нас список юзеров
  root 'users#index'

  # ресурс пользователей (экшен destroy не поддерживается)
  resources :users, except: [:destroy]

  # ресурс сессий (только три экшена :new, :create, :destroy)
  resources :sessions, only: [:new, :create, :destroy]

  # ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :questions, except: [:show, :new, :index]


  #  синонимы путей - в дополнение к созданным в ресурсах выше
  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
