module Teamweek
  module Api
    module Exporter

      def get_resource(entity, params=nil, context)
        response = bulk_get(entity, params)
        response.map { |h| context.new(h) }
      end

      def bulk_get(entity, params=nil)
        client.get(bulk_uri(entity, params), params)
      end

      def bulk_uri(entity, params=nil)
        filter_param = params[:filter] if params
        return full_path("/#{entity}/#{filter_param}?") if filter_param
        full_path("/#{entity}")
      end

    end
  end
end
