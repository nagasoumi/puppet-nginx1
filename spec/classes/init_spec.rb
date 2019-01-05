require 'spec_helper'
describe 'nginx1' do
  context 'with default values for all parameters' do
    it { should contain_class('nginx1') }
  end
end
