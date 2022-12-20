Rails.application.routes.draw do
  root 'session#login'
  post 'authorize', to: 'session#authorize'
  get 'logout', to: 'session#logout'
  resources :users
  get 'input', to: 'simon#input'
  post 'result', to: 'simon#show'
  get 'simon/xml_dump'
end
