require 'spec_helper'
require 'pry'

RSpec.describe ExtendWarranties::Api::Products, :vcr do
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
    subject { client.products.all(store_id) }
    its(:success?) { is_expected.to eql true }
  end

  describe '#create' do
    let(:params) {
      {
        'price': 2599,
        'title': 'Explosive Baseballs',
        'referenceId': '2324f800-7575-4c65-bd2c-22',
      }
    }

    subject { client.products.create(store_id, params) }
    its(:success?) { is_expected.to eql true }
  end

  # describe '#delete' do
  #   let(:reference_id) { '2324f800-7575-4c65-bd2c-22' }

  #   subject { client.products.delete(store_id, reference_id) }
  #   its(:success?) { is_expected.to eql true }
  # end

  describe '#find_by_id' do
    let(:reference_id) { '2324f800-7575-4c65-bd2c-588c89e8ab7f' }
    subject { client.products.find_by_id(store_id, reference_id) }
    its(:success?) { is_expected.to eql true }
  end
end


