require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PresencesController do

  #Delete these examples and add some real ones
  it "should use PresencesController" do
    controller.should be_an_instance_of(PresencesController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end
end
