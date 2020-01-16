module ShutterstockRuby
  # A class to hold all images related code.
  class Images < Connections

    def search(query, options = {})
      JSON.parse(get('/images/search', { query: query }.merge(options)))
    end

    def license(image_id, subscription_id, size, body_metadata, options = {})
      body = { images: [ { image_id: image_id }.merge(body_metadata)] }.to_json

      JSON.parse(post('/images/licenses', body, {subscription_id: subscription_id, size: size }), options)
    end

    class << self
      def search(query, options = {})
        client.search(query, options)
      end

      def license(image_id, subscription_id, size, body_metadata = {}, options = {})
        client.license(image_id, subscription_id, size, body_metadata, options)
      end
    end
  end
end
