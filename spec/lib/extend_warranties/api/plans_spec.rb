require 'spec_helper'

RSpec.describe ExtendWarranties::Api::Plans, :vcr do
  let(:access_token) { ENV['EXTEND_ACCESS_TOKEN'] }
  let(:store_id) { ENV['EXTEND_STORE_ID'] }
  let(:env) { :sandbox }

  let(:client) do
    ExtendWarranties::Client.new(
      access_token: access_token,
      store_id: store_id,
      env: env
    )
  end

  describe '#all' do
    subject { client.plans.all(store_id) }
    its(:success?) { is_expected.to eql true }
  end
end


