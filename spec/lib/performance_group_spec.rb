require 'spec_helper'
require 'PerformanceGroup'

describe 'a PerformanceGroup' do
  it 'can instantiate' do
    foo = PerformanceGroup.new
    expect(foo).to be_kind_of PerformanceGroup
  end
end
