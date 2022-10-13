Rails.application.routes.draw do
# This will generate devise routes
devise_for :users,
            controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
            }

            
# This creates routes for users folder
namespace :users do
  resources :users, path: '/', except: %i[create]
end
# books routes
namespace :books do
  resources :books, path: '/'
end
#   Issuedbook routes
get 'issued/index' , to: 'books/issuedbooks#index'
post 'issued/:user_id' , to: 'books/issuedbooks#issue'
delete 'return/:id', to:  'books/issuedbooks#return'

# resources :issuedbooks, controller: "books/issuedbooks"
# post 'issuedbooks/return/:id', to: "books/issuedbooks#return"



end