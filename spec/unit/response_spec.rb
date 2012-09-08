require 'spec_helper'

describe Rakuten::Response do
  let(:response) { 'simple_success' }
  let(:json_encoded_body) { stub_response(response) }
  subject { described_class.new(json_encoded_body) }

  describe '#initialize(json_encoded_body)' do
    its(:raw) { should == { 'result' => { 'success' => "1" }}}
  end

  describe '#success?' do
    it { should be_success }

    context "empty response" do
      let(:response) { 'simple_empty' }
      it { should be_success }
    end
  end

  describe '#empty?' do
    let(:response) { 'simple_empty' }
    it { should be_empty }
  end

  describe '#failed?' do
    let(:response) { 'simple_failed' }
    it { should be_failed }
  end

  describe '#errors' do
    let(:response) { 'failed_with_an_error' }

    its(:errors) { should be_an Array }
    its(:'errors.first') { should be_a Rakuten::ApiError }
    its(:'errors.first') { should be_a Rakuten::ApiError[10] }
  end

  describe '#error' do
    let(:response) { 'failed_with_an_error' }

    its(:error) { should be_a Rakuten::ApiError[10] }

    context 'without errors' do
      let(:response) { 'simple_failed' }

      its(:error) { should be_a Rakuten::ApiError }
    end
  end

  describe '#result' do
    context 'on success' do
      let(:response) { 'misc_getKeyInfo_success' }

      its(:result) { should be_a Hash }
      its(:result) { should have_key 'key' }
      its(:result) { should_not have_key 'success' }
    end

    context 'on failure' do
      let(:response) { 'simple_failed' }

      it 'should raise an error' do
        expect { subject.result }.to raise_error(Rakuten::ApiError)
      end
    end
  end
end
