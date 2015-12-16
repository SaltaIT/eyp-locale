require 'spec_helper'
describe 'locale' do

  context 'with defaults for all parameters' do
    it { should contain_class('locale') }
  end
end
