# Serializer class for formatting User data into JSON responses.
class UserSerializer
  # Includes JSONAPI::Serializer to handle JSON:API-compliant serialization.
  include JSONAPI::Serializer
  
  # Defines the attributes to include in the serialized JSON response.
  # Only includes `id` and `email` attributes in the JSON output.
  attributes :id, :email
  
  # Define a custom attribute for a user-friendly creation date format.
  # This adds a `created_date` attribute to the JSON output.
  # The safe navigation operator (&.) is used to avoid errors if `created_at` is nil.
  attribute :created_date do |user|
    user.created_at&.strftime('%d/%m/%Y')
  end
end
