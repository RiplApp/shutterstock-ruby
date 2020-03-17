module ShutterstockRuby
  # A class to hold all collections related code.
  class Collections < Connections

    def list_all_featured_collections(options = {})
      JSON.parse(get('/images/collections/featured', options))
    end

    def list_collection_items(collection_id, options = {})
      JSON.parse(get("/images/collections/featured/#{collection_id}/items", options))
    end

    class << self
      def list_all_featured_collections(options = {})
        client.list_all_featured_collections(options)
      end

      def list_collection_items(collection_id, options = {})
        client.list_collection_items(collection_id, options)
      end

    end
  end
end
