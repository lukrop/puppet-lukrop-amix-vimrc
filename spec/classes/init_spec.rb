require 'spec_helper'
describe 'amix_vimrc' do
  context 'with default values for all parameters' do
    it { should contain_class('amix_vimrc') }
  end
end
