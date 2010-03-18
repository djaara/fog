require 'fog/terremark/requests/get_catalog'
require 'fog/terremark/requests/get_catalog_item'
require 'fog/terremark/requests/get_organization'
require 'fog/terremark/requests/get_organizations'
require 'fog/terremark/requests/get_vapp_template'
require 'fog/terremark/requests/get_vdc'

module Fog
  module Terremark

    def self.new(options={})
      unless options[:terremark_password]
        raise ArgumentError.new('terremark_password is required to access terremark')
      end
      unless options[:terremark_username]
        raise ArgumentError.new('terremark_username is required to access terremark')
      end
      if Fog.mocking?
        Fog::Slicehost::Mock.new(options)
      else
        Fog::Slicehost::Real.new(options)
      end
    end

    class Mock

      def self.data
        @data ||= Hash.new do |hash, key|
          hash[key] = {}
        end
      end

      def self.reset_data(keys=data.keys)
        for key in [*keys]
          data.delete(key)
        end
      end

      def initialize(options={})
        @terremark_username = options[:terremark_username]
        @data = self.class.data[@terremark_username]
      end

    end

    class Real

      def initialize(options={})
        @terremark_password = options[:terremark_password]
        @terremark_username = options[:terremark_username]
        @host   = options[:host]   || "services.vcloudexpress.terremark.com"
        @path   = options[:path]   || "/api/v0.8"
        @port   = options[:port]   || 443
        @scheme = options[:scheme] || 'https'
        @cookie = get_organizations.headers['Set-Cookie']
      end

      private

      def request(params)
        @connection = Fog::Connection.new("#{@scheme}://#{@host}:#{@port}")
        headers = {}
        if @cookie
          headers.merge!('Cookie' => @cookie)
        end
        response = @connection.request({
          :body     => params[:body],
          :expects  => params[:expects],
          :headers  => headers.merge!(params[:headers] || {}),
          :host     => @host,
          :method   => params[:method],
          :parser   => params[:parser],
          :path     => "#{@path}/#{params[:path]}"
        })
      end

    end

  end
end
