Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'teams' => 'teams#index'
  get 'teams/members' => 'teams#show'
end
