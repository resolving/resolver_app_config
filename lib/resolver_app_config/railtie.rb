module ResolverAppConfig
  class Railtie < Rails::Railtie
    config.before_initialize do
      ResolverHTTPHeaders.configure
    end
  end
end
