# User model for handling user authentication and account management.
class User < ApplicationRecord
  # Include default Devise modules for authentication.
  # Other optional modules available are:
  # :confirmable - Sends emails to confirm the user's email address after registration.
  # :lockable - Locks an account after a specified number of failed sign-in attempts.
  # :timeoutable - Expires sessions that have been inactive for a certain duration.
  # :trackable - Tracks sign-in count, timestamps, and IP address.
  # :omniauthable - Adds support for third-party (OAuth) authentication.
  # :recoverable - Sends emails to reset a forgotten password.
  # :rememberable - Allows users to stay signed in for a long time without reauthenticating.

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
