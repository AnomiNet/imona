Her::API.setup url: Rails.application.secrets.api_url do |c|
  # Request
  c.use FaradayMiddleware::EncodeJson

  # Response
  if ENV['V'] and Rails.env.development?
    c.use Faraday::Response::Logger
  end
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
