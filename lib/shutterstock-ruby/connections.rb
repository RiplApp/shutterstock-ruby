module ShutterstockRuby
  class Connections
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def get(path, params = nil, options = {})
      ensure_credentials!

      options = { accept: :json }.merge(options)
      options[:params] = params unless params.nil?

      RestClient.get(build_url(path), add_bearer(options))
    end

    def post(path, body, params = nil, options = {})
      ensure_credentials!

      options[:params] = params unless params.nil?
      options[:content_type] = "application/json"

      RestClient.post(build_url(path), body, add_bearer(options))
    end

    protected
    def self.client
      @client ||= new(ShutterstockRuby.configuration)
    end

    private

    def build_url(path)

      if configuration.sandbox_mode.present? && configuration.sandbox_mode.to_s.downcase == 'true'
        api_base = ShutterstockRuby::API_BASE_SANDBOX
      else
        api_base = ShutterstockRuby::API_BASE
      end

      if configuration.access_token
        "https://#{api_base}#{path}"
      else
        "https://#{configuration.api_client}:#{configuration.api_secret}@#{api_base}#{path}"
      end
    end

    def add_bearer(options)
      options[:authorization] = "Bearer #{configuration.access_token}" if configuration.access_token
      options
    end

    def ensure_credentials!
      fail(Exception, 'Missing credentials') if (configuration.api_client.nil? || configuration.api_secret.nil?) && configuration.access_token.nil?
    end
  end
end
