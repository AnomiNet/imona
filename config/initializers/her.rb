Her::API.setup url: Rails.application.secrets.api_url do |c|
  # Request
  c.use FaradayMiddleware::EncodeJson

  # Response
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
