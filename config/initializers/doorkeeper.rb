Doorkeeper.configure do
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_from_credentials do
    User.find_by(username: params[:username]).try(:authenticate, params[:password])
  end

  access_token_methods :from_bearer_authorization,:from_access_token_param, :from_bearer_param


  grant_flows %w(password)

end
Doorkeeper.configuration.token_grant_types << "password"
