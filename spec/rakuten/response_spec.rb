require 'spec_helper'

describe Rakuten::Response do
  let(:status) { 1 }
  let(:result) { { success: status }}
  let(:body) { { result: result } }
  let(:json_encoded_body) { ActiveSupport::JSON.encode(body) }
  subject { described_class.new(json_encoded_body) }

  describe '#initialize(json_encoded_body)' do
    let(:body) { ActiveSupport::JSON.encode(result: { success: 1}) }
    subject { described_class.new(body) }

    its(:raw) { should == { 'result' => { 'success' => 1 }}}
  end

  describe '#success?' do
    it { should be_success }

    context "empty response" do
      let(:status) { 0 }
      it { should be_success }
    end
  end

  describe '#empty?' do
    let(:status) { 0 }
    it { should be_empty }
  end

  describe '#failed?' do
    let(:status) { -1 }
    it { should be_failed }
  end

  describe '#errors' do
    let(:result) {{
      success: -1,
      errors: { error: [
        {
          code: 10,
          message: "this is an error",
          help: 'http://foo.com'
        }
      ]}}
    }

    its(:errors) { should be_an Array }
    its(:'errors.first') { should be_a Rakuten::ApiError }
  end
end
