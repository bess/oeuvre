require 'spec_helper'
require 'PerformanceGroup'

describe 'PerformanceGroup' do
  it 'can instantiate' do
    foo = PerformanceGroup.new
    expect(foo).to be_kind_of PerformanceGroup
  end
  it "has a dbpedia uri" do
    foo = PerformanceGroup.new
    foo.dbpedia_uri = "http://dbpedia.org/page/The_Beatles"
    expect(foo.dbpedia_uri).to eql("http://dbpedia.org/page/The_Beatles")
  end
end
