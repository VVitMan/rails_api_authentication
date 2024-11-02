class UserSerializer
  # format json response to client
  include JSONAPI::Serializer
  attributes :id, :email
  
  # Define a custom attribute for the formatted creation date
  # operator (&.) prevents errors if created_at is nil.
  attribute :created_date do |user|
    user.created_at&.strftime('%d/%m/%Y')
  end
end
