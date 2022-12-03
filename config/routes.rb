Rails.application.routes.draw do
  root 'simon#input'
  get 'result', to: 'simon#show'
end
