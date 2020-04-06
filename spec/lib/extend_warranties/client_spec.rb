require 'spec_helper'
require 'pry'
RSpec.describe ExtendWarranties::Client do
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

  subject { client }

  it { is_expected.to respond_to :products }
  it { is_expected.to respond_to :plans }
  it { is_expected.to respond_to :contracts }
  it { is_expected.to respond_to :offers }
end
