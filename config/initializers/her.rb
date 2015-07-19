Her::API.setup url: Rails.application.secrets.api_url do |c|
  # Request
  c.use UserTokenAuth
  c.use XForwardedFor
  c.use FaradayMiddleware::EncodeJson

  # Response
  c.use Her::Middleware::DefaultParseJSON
  c.use ApiResponseNormalizer
  if ENV['V'] and Rails.env.development?
    c.use Faraday::Response::Logger
  end

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
