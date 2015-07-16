class ApiResponseNormalizer < Faraday::Response::Middleware
  def on_complete(env)
    if env[:body].blank?
      env[:body] = '{}'
    elsif !( env[:body][0] == '{' and env[:body][-1] == '}' ) \
    and !( env[:body][0] == '[' and env[:body][-1] == ']' )
      env[:body] = "{\"errors\":[\"#{ env[:body] }\"]}"
      Rails.logger.warn "Massaged malformed Api response to #{ env[:body] }"
    end
  end
end
