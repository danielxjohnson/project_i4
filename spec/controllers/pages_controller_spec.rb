require 'spec_helper'

describe PagesController do
render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

  it "should have the right title" do
  	get 'home'
  	response.should have_selector("title", :content => "Project I | Home")
  end
end  
  
    describe "GET 'secret'" do
    it "should be successful" do
      get 'secret'
      response.should be_success
    end
    
    it "should have the right title" do
  	get 'secret'
  	response.should have_selector("title", :content => "Project I | Secret")
  end
end
end