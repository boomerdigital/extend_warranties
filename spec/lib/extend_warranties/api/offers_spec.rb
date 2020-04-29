require 'spec_helper'

RSpec.describe ExtendWarranties::Api::Offers, :vcr do
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

  describe '#find_by_id' do
    let(:product_id) { '2324f800-7575-4c65-bd2c-588c89e8ab7f' }
    subject { client.offers.find_by_id(store_id, product_id) }
    its(:success?) { is_expected.to eql true }
  end
end
