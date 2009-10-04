require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Course do
  before(:each) do
    @valid_attributes = {
      :moodle_id => 1,
      :name => "value for name",
      :deleted_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Course.create!(@valid_attributes)
  end
end
