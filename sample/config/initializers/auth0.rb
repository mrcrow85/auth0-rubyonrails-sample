Rails.application.config.auth0 = Rails.application.config_for(:auth0)

Rails.application.config.middleware.use OmniAuth::Builder do
  auth0_config = Rails.application.config_for(:auth0)
  provider(
    :auth0,
    Rails.application.config.auth0['auth0_client_id'],
    Rails.application.config.auth0['auth0_client_secret'],
    Rails.application.config.auth0['auth0_domain'],
    # Use the env variable defined on .env instead of hard coding it
    callback_path: ENV['AUTH0_CALLBACK_URL'],
    authorize_params: {
      scope: 'openid profile email'
    }
  )
end
