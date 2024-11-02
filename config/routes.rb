Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  # sets up authentication routes for the User model.
  # path: '' => remove the default "/users" prefix from all routes
  devise_for :users, path: '', path_names: {
    # Changes the sign-in route from /sign_in to /login.
    sign_in: 'login',
    # Changes the sign-out route from /sign_out to /logout.
    sign_out: 'logout',
    # Changes the registration (sign-up) route from /sign_up to /signup.
    registration: 'signup'
  },
  # uses custom controllers for sessions and registrations, allowing for any custom logic you need.
  controllers: {
    # Uses the Users::SessionsController at app/controllers/users/sessions_controller.rb
    sessions: 'users/sessions',
    # Uses the Users::RegistrationsController at app/controllers/users/registrations_controller.rb
    registrations: 'users/registrations'
  }
end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
