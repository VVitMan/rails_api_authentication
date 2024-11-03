# Controller to handle requests for the current user's information.
# Requires a valid JWT token in the headers for access.
class CurrentUserController < ApplicationController
  # Ensures that only authenticated users can access this action.
  # If there is no valid JWT in the headers, it will return a 401 Unauthorized status.
  before_action :authenticate_user!

  # Index action to display information of the currently logged-in user.
  def index
    # Renders the current user's data as JSON, using UserSerializer to format the data.
    # Returns a 200 OK status if the user is authenticated.
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end
