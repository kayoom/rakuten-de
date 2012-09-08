require 'spec_helper'

describe Rakuten::ApiError do
  describe 'class' do
    subject { described_class }

    describe '#[code]' do
      let(:code) { 10 }
      subject { described_class[code] }

      its(:superclass) { should == described_class }
      its(:code) { should == 10 }

      context "code: 0" do
        let(:code) { 0 }

        it { should == described_class }
      end
    end
  end

  describe 'instance' do
    subject { described_class.new "this is an error", "http://foo.com" }

    its(:code) { should == 0 }
    its(:message) { should == "this is an error" }
    its(:help) { should == "http://foo.com" }
  end
end
