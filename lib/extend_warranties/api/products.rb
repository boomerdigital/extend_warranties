module ExtendWarranties
  module Api
    class Products < Base

      def all(store_id, args = {})
        raise ArgumentError, 'store_id is required' if store_id.blank?

        resp = connection.get "/stores/#{store_id}/products", args
        handle_response(resp)
      end

      def create(store_id, args = {})
        raise ArgumentError, 'store_id is required' if store_id.blank?

        resp = connection.post "/stores/#{store_id}/products", args
        handle_response(resp)
      end

      def find_by_id(store_id, product_id, args = {})
        raise ArgumentError, 'store_id is required' if store_id.blank?
        raise ArgumentError, 'product_id is required' if product_id.blank?

        resp = connection.get "/stores/#{store_id}/products/#{product_id}", args
        handle_response(resp)
      end

      def delete(store_id, product_id, args={})
        raise ArgumentError, 'store_id is required' if store_id.blank?
        raise ArgumentError, 'product_id is required' if product_id.blank?

        resp = connection.delete "/stores/#{store_id}/products/#{product_id}", args
        handle_response(resp)
      end
    end
  end
end
