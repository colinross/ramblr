Ramblr::Application.routes.draw do
  devise_for :users
  match "/dashboard" => "dashboard#index", :as => :dashboard, :via => "get"
  match "request_trust" => "application#request_trust", :as => :request_trust

  resources :api_tokens, :except => [:index, :show, :edit, :update]
  resources :item_lists, :except => [:index, :show] do
    resources :line_items, :except => [:index, :show]
  end
    

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'application#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
