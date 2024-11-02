class UserSerializer
  # format json response to client
  include JSONAPI::Serializer
  attributes :id, :email, :created_at
end
