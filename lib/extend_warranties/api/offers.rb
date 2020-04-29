module ExtendWarranties
  module Api
    class Offers < Base

      def find_by_id(store_id, product_id, args = {})
        raise ArgumentError, 'store_id is required' if store_id.blank?
        raise ArgumentError, 'product_id is required' if product_id.blank?

        resp = connection.get "/offers?storeId=#{store_id}&productId=#{product_id}", args
        handle_response(resp)
      end
    end
  end
end
