require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestResource do
  before(:each) do
    @valid_attributes = {
      :hoge => "value for hoge"
    }
  end

  it "should create a new instance given valid attributes" do
    TestResource.create!(@valid_attributes)
  end
end
