require 'spec_helper'

provider_class = Puppet::Type.type(:key_value_config).provider(:consul)

describe provider_class do

  context 'with the minimum params' do
    let(:resource) {
      Puppet::Type.type(:key_value_config).new(
        name: '/foo',
        value: 'bar',
        provider: 'consul',
      )
    }

    let(:provider) { resource.provider }

    it 'should be an instance of the ProviderV2' do
      expect(provider).to be_an_instance_of Puppet::Type::Key_value_config::ProviderConsul
    end

    describe 'exists?' do
      it 'should correctly report non-existent load balancers' do
      end

      it 'should correctly find existing load balancers' do
      end
    end

    describe 'create' do
      it 'should send a request to the ELB API to create the load balancer' do
      end
    end

    describe 'destroy' do
      it 'should send a request to the ELB API to destroy the load balancer' do
      end
    end

  end

end
