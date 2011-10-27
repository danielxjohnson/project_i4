require 'spec_helper'

describe SessionsController do
render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

	describe "Post 'create'" do 
        describe "invalid signin" do
            before(:each) do
                @attr = { :email => "email@example.com", :password => "invalid" }
            end
            
            it "should re-render the new log in page" do
                post :create, :session => @attr
                response.should render_template('new')
            end
            
            it "should have the right title" do
                post :create, :session => @attr
                response.should have_selector("title", :content => "Log In")
            end
            
            it "should have a flash.now message" do
                post :create, :session => @attr
                flash.now[:error].should =~ /Invalid Email or Password/i
            end
        end    

	end
	
	describe "Post 'create'" do 
        describe "valid signin" do
            before(:each) do
                @test_user = Factory(:user)
                @attr = {:email => @test_user.email, :password => @test_user.password_confirmation}
            end
            
            it "should redirect to home page after sign in" do
                post :create, @attr
                response.should redirect_to(root_path)
                
               # if session[:return_to_url].nil?
               # 	response.should redirect_to(root_path)
               # else #this will never be true
               # 	response.should redirect_to(session[:return_to_url])
               # end
            end
            
            
            it "should sign the user in" do
                post :create, @attr
                controller.current_user.should == @test_user
                controller.should be_logged_in
            end
        end    

	end
end
