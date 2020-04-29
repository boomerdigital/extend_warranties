require 'spec_helper'

RSpec.describe ExtendWarranties::Api::Contracts, :vcr do
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

  describe '#create' do
    let(:params) {
      {
        'transactionId': 'c57ed096-24ef-49a4-a20a-d1b8bf770980',
        'transactionDate': 1588172123,
        'currency': 'USD',
        'customer': {
          'email': 'acreilly3@gmail.com',
          'name': 'Allison'
        },
        'product': {
          'referenceId': '2324f800-7575-4c65-bd2c-22',
          'purchasePrice': 3599
        },
        'plan': {
          'purchasePrice': 3599,
          'planId': '10001-auto-part-base-replace-1y'
        }
      }
    }

    subject { client.contracts.create(store_id, params) }
    its(:success?) { is_expected.to eql true }
  end

  # describe '#refund' do
  #   let(:contract_id) { '06d6e4ac-1878-4a71-8f0f-1f5e34efdd94' }

  #   subject { client.contracts.refund(store_id, contract_id) }
  #   its(:success?) { is_expected.to eql true }
  # end

  describe '#get_invoice' do
    let(:contract_id) { 'fc893e2f-a368-46b6-b5b0-9525bf666b30' }

    subject { client.contracts.get_invoice(store_id, contract_id) }
    its(:success?) { is_expected.to eql true }
  end
end


