require 'spec_helper'
require 'rails'
require 'resolver_app_config/resolver_http_headers'

RSpec.describe ResolverHTTPHeaders do
  class DummyRailsApp < Rails::Application; end

  describe '.configure' do
    it 'adds a Strict-Transport-Security header' do
      headers = ResolverHTTPHeaders.configure
      expect(Rails.application.config.action_dispatch.default_headers).to match({
        'Strict-Transport-Security' => 'max-age=30',
        'X-Content-Type-Options' => 'nosniff',
        'X-Frame-Options' => 'SAMEORIGIN',
        'X-XSS-Protection' => '1; mode=block',
      })
    end
  end
end
