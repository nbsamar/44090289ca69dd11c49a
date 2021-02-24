Rails.application.routes.draw do

  namespace :api do
    namespace :toyrobot do
      post ':id/orders', to: 'movements#create'
    end
  end
end
