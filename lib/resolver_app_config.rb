require "resolver_app_config/version"

if defined?(Rails)
  require "resolver_app_config/railtie"
  require "resolver_app_config/resolver_http_headers"
end
