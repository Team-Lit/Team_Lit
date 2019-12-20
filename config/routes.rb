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
    get 'public_users/confirm'
    resources :public_users, only:[:show, :edit, :update, :destroy,:confirm] do
      resource :public_cart_items, only:[:show]
      resource :public_deliveries, only:[:show,:create]
      resources :public_orders, only:[:confirm,:index, :create]
    end
    
    resources :public_products, only:[:index, :show] do
      resource :public_cart_items, only:[:create]
    end
    resources :public_cart_items, only:[ :update, :destroy]
    resources :public_deliveries, only:[:edit, :update, :destroy]
    resources :public_orders, only:[:show]
  end

  namespace :admin do
    resources :admin_users
    resources :admin_artists, only:[:new, :create, :destroy]
    resources :admin_genres, only:[:new, :create, :destroy]
    resources :admin_labels, only:[:new, :create, :destroy]

    resources :admin_products do
      post 'admin/admin_products/:id' => 'admin/admin_products#show'
      resources :admin_arrivals, only:[:new, :create]
    end

    resources :admin_arrivals, only:[:index]
    resources :admin_orders, only:[:index, :show, :update]
    resources :admin_charges, only:[:edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
