require 'spec_helper'
describe 'spark' do

  context 'with defaults for all parameters' do
    it { should contain_class('spark') }
  end
end
