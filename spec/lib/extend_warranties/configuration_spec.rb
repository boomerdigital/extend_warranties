require 'spec_helper'

RSpec.describe ExtendWarranties::Configuration do
  let(:access_token) { 'access_token' }
  let(:store_id) { 'store_id' }
  let(:env) { :sandbox }

  subject do
    ExtendWarranties::Configuration.new(
      access_token: access_token,
      store_id: store_id,
      env: env
    )
  end

  it { is_expected.to respond_to :sandbox }
  it { is_expected.to respond_to :base_url }
  it { is_expected.to respond_to :env }
  it { is_expected.to respond_to :headers }

  context 'when :access_token is missing' do
    let(:access_token) { nil }
    it { expect { subject }.to raise_error ArgumentError }
  end

  context 'when :store_id is missing' do
    let(:store_id) { nil }
    it { expect { subject }.to raise_error ArgumentError }
  end

  context 'when :env is missing' do
    let(:env) { nil }
    it { expect { subject }.to raise_error ArgumentError }
  end

  context 'when :env is neither :sandbox or :production' do
    let(:env) { :invalid }
    it { expect { subject }.to raise_error ArgumentError }
  end

  context 'when NOT in sandbox mode' do
    let(:env) { :production }

    its(:env) { is_expected.to eql ExtendWarranties::Configuration::PRODUCTION }
    its(:base_url) { is_expected.to eql ExtendWarranties::Configuration::REST_URLS[:production] }
  end

  context 'when in sandbox mode' do
    its(:env) { is_expected.to eql ExtendWarranties::Configuration::SANDBOX }
    its(:base_url) { is_expected.to eql ExtendWarranties::Configuration::REST_URLS[:sandbox] }
  end
end
