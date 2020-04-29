module ExtendWarranties
  module Api
    class Plans < Base

      def all(store_id, args = {})
        resp = connection.get "/offers/list?storeId=#{store_id}", args

        handle_response(resp)
      end
    end
  end
end
