Rails.application.routes.draw do
  get 'session/authorize'
  get 'session/logout'
  resources :users
  root 'simon#input'
  post 'result', to: 'simon#show'
  get 'simon/xml_dump'
end
