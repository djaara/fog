module Fog
  module Terremark
    class Real

      require 'fog/terremark/parsers/get_vdc'

      # Get details of a vdc
      #
      # ==== Parameters
      # * vdc_id<~Integer> - Id of vdc to lookup
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
      def get_vdc(vdc_id)
        request(
          :expects  => 200,
          :method   => 'GET',
          :parser   => Fog::Parsers::Terremark::GetVdc.new,
          :path     => "vdc/#{vdc_id}"
        )
      end

    end

    class Mock

      def get_vdc(vdc_id)
        raise MockNotImplemented.new("Contributions welcome!")
      end

    end
  end
end
