Rails.application.routes.draw do
  root 'simon#input'
  post 'result', to: 'simon#show'
end
