# User model for handling user authentication and account management.
class User < ApplicationRecord
  
  # JTIMatcher is included to ensure JWT tokens can be revoked by using a "jti" (JWT ID) attribute.
  # This strategy invalidates old tokens automatically when a new token is issued to the user.
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  # Configures Devise to use specific authentication modules:
  # :database_authenticatable - Handles password hashing and storage.
  # :registerable - Allows users to register themselves.
  # :validatable - Validates email and password formats.
  # :jwt_authenticatable - Enables JWT authentication using JTIMatcher for revocation.
  # jwt_revocation_strategy: self - Specifies that this model (User) will handle JWT revocation.
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
