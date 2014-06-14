require 'spec_helper'
describe 'firefox' do

  context 'with defaults for all parameters' do
    it { should contain_class('firefox') }
  end
end
