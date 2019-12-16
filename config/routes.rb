Rails.application.routes.draw do

  devise_for :admins,controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :publics,controllers: {
    sessions:      'publics/sessions',
    passwords:     'publics/passwords',
    registrations: 'publics/registrations',
  }




  namespace :public do
    get 'public_orders/confirm'
    get 'public_orders/result'
    get 'public_users/confirm'
    resources :public_users, only:[:show, :edit, :update, :destroy,:confirm] 
    resources :public_products, only:[:index, :show]
    resources :public_cart_items, only:[:index, :create, :update, :destroy]
    resources :public_deliveries, only:[:index, :edit, :update, :destroy,:create]
    resources :public_orders, only:[:confirm, :result, :new, :create, :update]
  end

  namespace :admin do
    resources :admin_users
    resources :admin_products
    resources :admin_arrivals, only:[:index, :new, :create]
    resources :admin_orders, only:[:index, :show, :update]
    resources :admin_charges, only:[:edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
