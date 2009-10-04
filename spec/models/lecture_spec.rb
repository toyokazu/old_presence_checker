require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lecture do
  before(:each) do
    @valid_attributes = {
      :course_id => 1,
      :description => "value for description",
      :start_time => Time.now,
      :end_time => Time.now,
      :deleted_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Lecture.create!(@valid_attributes)
  end
end
