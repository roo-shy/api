class Api::UsersController < ApplicationController

  before_action :doorkeeper_authorize!
  protect_from_forgery with: :null_session

  def me
    @user = current_resource_owner
    render "api/registrations/user"
  end

  def delete
    @user = current_resource_owner
    @user.destroy
    head :ok
  end

  private

  #Find the user that owns the access token
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end
