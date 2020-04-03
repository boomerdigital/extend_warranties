require 'spec_helper'

RSpec.describe ExtendWarranties::Api::Base do
  let(:connection) { Faraday.new }
  subject { described_class.new connection }

  it { is_expected.to respond_to :connection }
  its(:connection) { is_expected.to eql connection }
end
