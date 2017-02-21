Rails.application.routes.draw do
  root 'sessions#new'

  get '/signup', to: 'staffs#new', as: 'signup'
  post '/signup', to: 'staffs#create'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/search', to: 'search#query', as: 'search'

  get 'customers/:uuid', to: 'customers#show', as: 'customers'
  get 'customers/:uuid/pin_generate', to: 'customers#pin_generate', as: 'customers_pin_generate'
  post 'customers/:uuid/pin_generate', to: 'customers#pin_generate'

  get 'devices/:uuid', to: 'devices#show', as: 'device'
  get 'devices/search', to: 'devices#show'

  get 'device_setting/:device_id', to: 'device_setting#show', as: 'device_setting'
  post 'device_setting/setting', to: 'device_setting#setting', as: 'setting'
  post 'device_setting/reboot', to: 'device_setting#reboot_device', as: 'reboot_device'
  post 'device_setting/log', to: 'device_setting#enable_log', as: 'enable_log'
  post 'device_setting/delete', to: 'device_setting#delete_device', as: 'delete_device'
  post 'device_setting/device_search', to: 'device_setting#device_search', as: 'device_search'

  resources :staffs, only: %w(edit update)

  namespace :admin do
    resources :staffs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
