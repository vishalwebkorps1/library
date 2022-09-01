Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'


  namespace :users do
    resources :users, path: '/'
  end

  namespace :books do
    resources :books, path: '/'
  end

  
  # roles routes
  resources :roles, controller: "users/roles"
  resources :issuedbooks, controller: "books/issuedbooks"

  post 'issuedbooks/return/:id', to: "books/issuedbooks#return"
end