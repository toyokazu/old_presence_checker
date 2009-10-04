require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Presence do
  before(:each) do
    @valid_attributes = {
      :login => "value for login",
      :username => "value for username",
      :mail => "value for mail",
      :course_id => 1,
      :ip_addr => "value for ip_addr",
      :lecture_id => 1,
      :deleted_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Presence.create!(@valid_attributes)
  end
end
