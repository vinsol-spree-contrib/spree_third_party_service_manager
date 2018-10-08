Spree::Core::Engine.add_routes do
  # Add your extension routes here

  namespace :admin do
    resources :third_party_services do
      member do
        patch :enable
        patch :disable
      end
    end

    resources :pages
  end
end
