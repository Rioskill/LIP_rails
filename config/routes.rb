Rails.application.routes.draw do
  root 'simon#input'
  post 'result', to: 'simon#show'
  get 'xml_dump', to: 'simon#xml_dump'
end
