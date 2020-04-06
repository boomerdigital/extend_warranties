module ExtendWarranties
  class Client
    @namespaces = []
    @connection = nil

    ##
    # Defines a method to access class instance.
    #
    def self.namespace(name)
      converted = name.to_s.split('_').map(&:capitalize).join
      klass = ExtendWarranties::Api.const_get(converted)
      @namespaces << klass
    end

    namespace :products

    namespace :plans

    namespace :contracts

    namespace :offers


    def initialize(args = {})
      @configuration = ExtendWarranties::Configuration.new(args)

      @connection = Faraday.new(url: @configuration.base_url) do |conn|
        conn.request :json
        conn.headers = @configuration.headers

        conn.response :json
        conn.response :logger

        conn.adapter  Faraday.default_adapter
      end

      create_instances
    end

    private

    def create_instances
      namespaces = self.class.instance_variable_get(:@namespaces)
      namespaces.each do |klass|
        reader = klass.to_s.split('::').last.underscore
        self.class.send(:define_method, reader.to_sym) { klass.new @connection }
      end
    end
  end
end
