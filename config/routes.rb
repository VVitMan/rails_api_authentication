Rails.application.routes.draw do
  # Define a route to get the information of the current logged-in user.
  # Accessible via http://localhost:port/current_user.
  get '/current_user', to: 'current_user#index'

  # Sets up authentication routes for the User model with Devise.
  # The `path: ''` option removes the default "/users" prefix from all routes, making URLs cleaner.
  devise_for :users, path: '', path_names: {
    # Changes the default Devise sign-in route from /sign_in to /login.
    sign_in: 'login',
    # Changes the default Devise sign-out route from /sign_out to /logout.
    sign_out: 'logout',
    # Changes the default Devise registration (sign-up) route from /sign_up to /signup.
    registration: 'signup'
  },
  # Specifies custom controllers for handling session and registration actions, 
  # allowing for any additional logic or custom responses.
  controllers: {
    # Specifies the SessionsController to use for login and logout actions,
    # defined in app/controllers/users/sessions_controller.rb.
    sessions: 'users/sessions',
    # Specifies the RegistrationsController to use for sign-up and account deletion actions,
    # defined in app/controllers/users/registrations_controller.rb.
    registrations: 'users/registrations'
  }
end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
