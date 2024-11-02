class CurrentUserController < ApplicationController
  # will ensure that we only see a 200 response if we have a valid JWT in the headers. If we don’t this endpoint should return a 401 status code.
  before_action :authenticate_user!
  def index
    render json: UserSerialzier.new(current_user).serializeable_hash[:data][:attributes], status: :ok
  end
end
