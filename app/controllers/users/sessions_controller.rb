# frozen_string_literal: true
# Define a custom SessionsController for handling user sessions in a JSON API format.
# Inherits from Devise's SessionsController for authentication methods and actions.
class Users::SessionsController < Devise::SessionsController
  # Include RackSessionFix to handle any potential session issues in API requests
  include RackSessionFix
  
  # Set the controller to respond to JSON format, suitable for API responses
  respond_to :json

  private

  # Custom method to handle response after a successful or failed login attempt.
  def respond_with(resource, _opts = {})
    # Check if the user (resource) exists and is saved in the database.
    if resource.persisted?
      # Respond with a success message and user data if login is successful.
      render json: {
        status: { code: 200, message: 'Logged in successfully.' },
        # Use UserSerializer to serialize user data into a JSON format.
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      # Respond with an error message if login credentials are invalid.
      render json: {
        status: { code: 401, message: 'Invalid email or password.' }
      }, status: :unauthorized
    end
  end

  # Custom method to handle response when a user logs out or session is terminated.
  def respond_to_on_destroy
    # Check if there is a currently logged-in user.
    if current_user
      # Respond with a success message if logout was successful.
      render json: {
        status: 200,
        message: "Logged out successfully"
      }, status: :ok
    else
      # Respond with an error message if no active session is found.
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end


