class UserTokenAuth < Faraday::Middleware
  def call(env)
    if RequestStore.store[:user_token]
      env[:request_headers]["X-User-Token"] = RequestStore.store[:user_token]
    end
    @app.call(env)
  end
end
