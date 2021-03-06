Rails.application.routes.draw do
 
  namespace :api, defaults: {format: :json} do
  
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :locals
    
    controller :locals do
      get 'alphabetical_order', action: :alphabetical_order
    end

  end 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
