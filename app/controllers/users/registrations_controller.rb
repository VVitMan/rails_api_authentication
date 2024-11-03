# frozen_string_literal: true
# Custom RegistrationsController for handling user registration in a JSON API format.
# Inherits from Devise's RegistrationsController for registration actions.
class Users::RegistrationsController < Devise::RegistrationsController
  # Include RackSessionFix to handle potential session issues in API requests
  include RackSessionFix

  # Set the controller to respond to JSON format, suitable for API responses
  respond_to :json

  private

  # Custom method to handle responses after registration or account deletion.
  def respond_with(resource, _opts = {})
    # Check if the request is a POST request and the user (resource) is saved in the database.
    if request.method == "POST" && resource.persisted?
      # Respond with a success message and serialized user data if sign-up is successful.
      render json: {
        status: { code: 200, message: "Signed up successfully." },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    # Check if the request is a DELETE request, indicating an account deletion.
    elsif request.method == "DELETE"
      # Respond with a success message if account deletion is successful.
      render json: {
        status: { code: 200, message: "Account deleted successfully." }
      }, status: :ok
    else
      # If the request is not successful, return an error message with specific validation errors.
      render json: {
        status: { code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end

