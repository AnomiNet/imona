class XForwardedFor < Faraday::Middleware
  def call(env)
    if RequestStore.store[:http_x_forwarded_for]
      env[:request_headers]["X-Forwarded-For"] = RequestStore.store[:http_x_forwarded_for]
    else
      Rails.logger.warn("X-Forwarded-For is not set! This is insecure.")
    end
    @app.call(env)
  end
end
