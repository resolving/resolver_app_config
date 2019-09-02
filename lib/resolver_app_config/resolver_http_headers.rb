module ResolverHTTPHeaders
  # Add some default HTTP headers to all HTTP responses
  #
  # As per https://guides.rubyonrails.org/v5.0/security.html#default-headers,
  # X-Frame-Options, X-XSS-Protection and X-Content-Type-Options are already
  # set to secure values by default for all Rails 4 and 5 application.
  #
  # Strict-Transport-Security - this header sets options for HSTS
  # (HTTP strict transport security). This is currently set to a short
  # time (30 seconds) and specifically excludes all subdomains and browser
  # preloading for testing purposes.
  #
  # Headers that could be added to this list:
  #
  # * Content-Security-Policy
  # * Referrer-Policy
  # * Feature-Policy
  # * Expect-CT
  def self.configure
    Rails.application.config.action_dispatch.default_headers = {
      'Strict-Transport-Security' => 'max-age=30'
    }
  end
end