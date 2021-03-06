Rails.application.routes.draw do
  root 'sessions#new'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/revision_history', to: 'sessions#revision_history', as: 'revision_history'

  get '/search', to: 'search#query', as: 'search'

  get '/unresponsive_devices', to: 'silent_device#show', as: 'silent_device'

  get '/unresponsive_devices_search', to: 'silent_device#search', as: 'silent_device_search'

  get 'customers/:uuid', to: 'customers#show', as: 'customer_info'
  get 'customers/:uuid/download_device_information_csv', to: 'customers#download_device_information_csv', as: 'customers_download'
  get 'customers/:uuid/pin_generate', to: 'customers#pin_generate', as: 'customers_pin_generate'
  post 'customers/:uuid/pin_generate', to: 'customers#pin_generate'

  get 'devices/search', to: 'devices#show'

  get 'devices/:device_id/device_settings', to: 'device_setting#show', as: 'device_setting'
  get 'devices/:device_id/device_settings/setting', to: 'device_setting#setting', as: 'setting'
  get 'devices/:device_id/history_log', to: 'devices#history_log', as: 'history_log'
  get 'devices/:device_id/history_log/notification_log', to: 'devices#notification_log', as: 'notification_log'
  get 'devices/:device_id/history_log/network_status_log', to: 'devices#network_status_log', as: 'network_status_log'
  get 'devices/:device_id/device_settings/maintenance_information', to: 'device_setting#maintenance_information', as: 'maintenance'
  get 'devices/:device_id/device_settings/subscription', to: 'device_setting#subscription', as: 'subscription'
  get 'devices/:device_id/device_settings/reboot', to: 'device_setting#reboot_device', as: 'reboot_device'
  post 'devices/:device_id/device_settings/reboot', to: 'device_setting#reboot_device'
  get 'devices/:device_id/device_settings/enable_log', to: 'device_setting#enable_log', as: 'enable_log'
  post 'devices/:device_id/device_settings/enable_log', to: 'device_setting#enable_log'
  get 'devices/:device_id/device_settings/delete', to: 'device_setting#delete_device', as: 'delete_device'
  delete 'devices/:device_id/device_settings/delete', to: 'device_setting#delete_device'
  get 'devices/:device_id/device_settings/search', to: 'device_setting#device_search', as: 'device_search'

  resources :staffs, only: %w(edit update)

  namespace :admin do
    resources :staffs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
