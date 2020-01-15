module ShutterstockRuby
  class Configuration
    attr_accessor :access_token
    attr_accessor :api_client
    attr_accessor :api_secret
    attr_accessor :sandbox_mode

    def initialize(args)
      @access_token = args[:access_token]
      @api_client = args[:api_client]
      @api_secret = args[:api_secret]
      @sandbox_mode = args[:sandbox_mode]
    end
  end
end
