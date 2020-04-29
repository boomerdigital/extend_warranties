module ExtendWarranties
  module Api
    class Contracts < Base

      def create(store_id, args = {})
        raise ArgumentError, 'store_id is required' if store_id.blank?

        resp = connection.post "/stores/#{store_id}/contracts", args
        handle_response(resp)
      end

      def refund(store_id, contract_id, args = {})
        raise ArgumentError, 'store_id is required' if store_id.blank?
        raise ArgumentError, 'contract_id is required' if contract_id.blank?

        resp = connection.post "/stores/#{store_id}/contracts/#{contract_id}/refund", args
        handle_response(resp)
      end

      def get_invoice(store_id, contract_id, args = {})
        raise ArgumentError, 'store_id is required' if store_id.blank?
        raise ArgumentError, 'contract_id is required' if contract_id.blank?

        resp = connection.get "/stores/#{store_id}/contracts/#{contract_id}/invoice", args
        handle_response(resp)
      end
    end
  end
end
