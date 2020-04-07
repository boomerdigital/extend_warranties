module ExtendWarranties
  module Api
    class Plans < Base

      def all(store_id, args = {})
        # Think about passing store id in args
        resp = connection.get "/offers/list?={${store_id}}", args

        handle_response(resp)
      end
    end
  end
end
