Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :videos, :path => '' do
    resources :videos, :path => Refinery::Videos.videos_path, :only => [:index]
  end

  # Admin routes
  namespace :videos, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :videos, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
