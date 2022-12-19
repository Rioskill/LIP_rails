Rails.application.routes.draw do
  root 'proxy#input'
  get 'result', to: 'proxy#output'
end
