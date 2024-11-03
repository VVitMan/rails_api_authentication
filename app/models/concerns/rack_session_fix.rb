# app/controllers/concerns/rack_session_fix.rb

# This module provides a workaround for an issue with Devise in Rails 7 when using API-only mode.
# In API-only mode, we don't use session cookies, but Devise expects a session to exist, causing errors.
# This fix creates a "fake" Rack session to satisfy Devise's session requirements, avoiding those errors.
module RackSessionFix
    extend ActiveSupport::Concern
  
    # Defines a fake Rack session class to act as a placeholder.
    # The `enabled?` method returns false, signaling that sessions are not enabled.
    class FakeRackSession < Hash
      def enabled?
        false
      end
    end
  
    # When this module is included, it sets up the fake session before each action.
    included do
      before_action :set_fake_rack_session_for_devise
  
      private
  
      # Sets a fake Rack session for Devise by assigning an instance of FakeRackSession to `rack.session`.
      # This prevents Devise from raising errors about missing sessions in API-only mode.
      def set_fake_rack_session_for_devise
        request.env['rack.session'] ||= FakeRackSession.new
      end
    end
  end
  
  