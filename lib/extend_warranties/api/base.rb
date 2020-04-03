module ExtendWarranties
  module Api
    class Base
      attr_reader :connection

      def initialize(connection)
        @connection = connection
      end

      protected

      def handle_response(response)
        # Wrap in our own response class
        ExtendWarranties::Response.new response
      end
    end
  end
end
