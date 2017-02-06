require 'net/http'
require 'json'
require 'openssl'

module BOC
  class API
    DEFAULT_ENDPOINT = 'https://connections.brother.com'.freeze

    def initialize endpoint
      @endpoint = endpoint || DEFAULT_ENDPOINT
    end

    def connect req
      https = create_http
      res = https.start { |http| http.request(req) }
      res.value
      block_given? ? yield(res) : res.body
    rescue Net::HTTPExceptions
      raise $ERROR_INFO, "Failed to #{req.method} #{req.path} (#{$ERROR_INFO.data.code} #{$ERROR_INFO.data.message})"
    rescue Timeout::Error, IOError, SystemCallError
      throw "Net::HTTP.#{req.method.capitalize} raises exception: #{$ERROR_INFO.class}, '#{$ERROR_INFO.message}'"
    end

    def create_http
      uri = URI.parse(@endpoint)
      px_uri = URI.parse(ENV['http_proxy'] || '')
      px_user, px_pswd = px_uri.userinfo.split(/:/) if px_uri.userinfo
      https = Net::HTTP::Proxy(px_uri.host, px_uri.port, px_user, px_pswd)
                       .new(uri.host, uri.port)
      https.use_ssl = (uri.scheme == 'https')
      if https.use_ssl?
        https.verify_mode = OpenSSL::SSL::VERIFY_NONE
        https.cert_store = ssl_certificate
      end
      https
    end

    def ssl_certificate
      store = OpenSSL::X509::Store.new
      store.set_default_paths
    end
  end
end
