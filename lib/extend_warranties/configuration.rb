module ExtendWarranties
  class Configuration
    attr_reader :sandbox, :base_url, :env, :access_token, :store_id, :headers

    REST_URLS = {
      sandbox:    'https://api-demo.helloextend.com',
      production: 'https://api.helloextend.com'
    }

    SANDBOX = :sandbox
    PRODUCTION = :production

    def initialize(args = {})
      validate_args(args)

      @env = args[:env].to_sym
      @sandbox = @env == SANDBOX
      @base_url = REST_URLS[env]
      @access_token = args[:access_token]
      @headers = args[:headers] || { 'Content-Type' => 'application/json', 'X-Extend-Access-Token' => @access_token }
      @store_id = args[:store_id]
    end

    private

    def validate_args(args)
      raise ArgumentError, 'access token is required' if args[:access_token].blank?
      raise ArgumentError, 'store id is required' if args[:store_id].blank?
      raise ArgumentError, 'env is required' if args[:env].blank?

      return if [SANDBOX, PRODUCTION].include?(args[:env].to_sym)
      raise ArgumentError, 'env must be of :sandbox or :production'
    end
  end
end
