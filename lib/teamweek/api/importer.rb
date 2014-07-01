module Teamweek
  module Api
    module Importer

      def bulk_import(entity, data, context)
        response = bulk_post(entity, data)
        response.map { |h| context.new(h) }
      end

      def bulk_post(entity, data)
        client.post(bulk_uri(entity), { entity => data })
      end

      def bulk_uri(entity)
        full_path("/#{entity}/bulk_import.json")
      end

    end
  end
end