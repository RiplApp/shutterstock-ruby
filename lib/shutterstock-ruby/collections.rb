module ShutterstockRuby
  # A class to hold all collections related code.
  class Collections < Connections

    def list_all_featured_collections(options = {})
      JSON.parse(get('/images/collections/featured', options))
    end

    class << self
      def list_all_featured_collections(options = {})
        client.list_all_featured_collections(options)
      end

    end
  end
end
