Rails.application.routes.draw do
  root 'simon#input'
  post 'result', to: 'simon#show'
  get 'simon/xml_dump'
end
