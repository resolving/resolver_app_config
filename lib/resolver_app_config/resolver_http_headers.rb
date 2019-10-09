module ResolverHTTPHeaders
  # Add some default HTTP headers to all HTTP responses
  #
  # As per https://guides.rubyonrails.org/v5.0/security.html#default-headers,
  # X-Frame-Options, X-XSS-Protection and X-Content-Type-Options are already
  # set to secure values by default for all Rails 4 and 5 application.
  # However, since we are setting some extra default headers here, we also
  # need to reiterate these ones.
  #
  # Strict-Transport-Security - this header sets options for HSTS
  # (HTTP strict transport security). This is currently set to 1 year
  # with preloading enabled. Subdomains are disabled since they are under
  # the control of various teams.
  #
  # X-Content-Type-Options - this header opts the site out of automatic
  # MIME type sniffing, specifically in Internet Explorer.
  #
  # X-Frame-Options - this header restricts framing of this site to other
  # pages in the same origin (i.e. domain).
  #
  # X-XSS-Protection - this header stops a page from loading if an XSS
  # attack is detected by the browser.
  #
  # Headers that could be added to this list:
  #
  # * Content-Security-Policy
  # * Referrer-Policy
  # * Feature-Policy
  # * Expect-CT
  def self.configure
    Rails.application.config.action_dispatch.default_headers = {
      'Strict-Transport-Security' => 'max-age=31536000; preload',
      'X-Content-Type-Options' => 'nosniff',
      'X-Frame-Options' => 'SAMEORIGIN',
      'X-XSS-Protection' => '1; mode=block',
    }
  end
end
