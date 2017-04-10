Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'characters', to: 'characters#index'

  root 'public#index'
end
