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
  end
end
