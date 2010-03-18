module Fog
  module Terremark
    class Real

      require 'fog/terremark/parsers/get_vapp_template'

      # Get details of a vapp template
      #
      # ==== Parameters
      # * vapp_template_id<~Integer> - Id of vapp template to lookup
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
      def get_vapp_template(vapp_template_id)
        request(
          :expects  => 200,
          :method   => 'GET',
          :parser   => Fog::Parsers::Terremark::GetVappTemplate.new,
          :path     => "vAppTemplate/#{vapp_template_id}"
        )
      end

    end

    class Mock

      def get_vapp_template(vapp_template_id)
        raise MockNotImplemented.new("Contributions welcome!")
      end

    end
  end
end
