module Fog
  module Terremark
    class Real

      require 'fog/terremark/parsers/get_catalog_item'

      # Get details of a catalog item
      #
      # ==== Parameters
      # * catalog_item_id<~Integer> - Id of catalog item to lookup
      #
      # ==== Returns
      # * response<~Excon::Response>:
      #   * body<~Hash>:

      # FIXME

      #     * 'CatalogItems'<~Array>
      #       * 'href'<~String> - linke to item
      #       * 'name'<~String> - name of item
      #       * 'type'<~String> - type of item
      #     * 'description'<~String> - Description of catalog
      #     * 'name'<~String> - Name of catalog
      def get_catalog_item(catalog_item_id)
        request(
          :expects  => 200,
          :method   => 'GET',
          :parser   => Fog::Parsers::Terremark::GetCatalogItem.new,
          :path     => "catalogItem/#{catalog_item_id}"
        )
      end

    end

    class Mock

      def get_catalog_item(catalog_item_id)
        raise MockNotImplemented.new("Contributions welcome!")
      end

    end
  end
end
