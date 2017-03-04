Rails.application.routes.draw do
  	
  	devise_for :users
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	namespace :admin do
  		resources :events
  	end

 	resources :events do
  		resources :messages, :controller => "event_messages"
  	end

  	root to: "events#index"

end
