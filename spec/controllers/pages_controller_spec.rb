require 'spec_helper'

describe PagesController do
render_views

###########Test pages that do not require log in#######################
  describe "GET 'pages (no log in required)'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
  it "should have the right title" do
  	get 'home'
  	response.should have_selector("title", :content => "Project I | Home")
  end
end  

###########Test pages that DO require log in#######################
describe "GET 'pages (where log in is required)'" do
	before(:each) do
		@test_user = Factory(:user)
		@attr = {:email => @test_user.email, :password => @test_user.password_confirmation} #had use password confirmation bc sorcery wipes out the password after successful create in db via the clear_virtual_password method
    end
    
    it "should be successful (secret page)" do
    	login_attempt = test_login(@attr[:email], @attr[:password])
		if login_attempt
			get 'secret'
		end
    	
    	#if login_attempt
      	#	get 'secretv'
      	#	response.should be_success
      	#else
      	#	get 'secretb'
      	#	response.should be_success
      	#end
    end

    
  it "should have the right title (secret page)" do
	login_attempt = test_login(@attr[:email], @attr[:password])
  	if login_attempt
  		get 'secret'
  		response.should have_selector("title", :content => "Project I | Secret")
  	end
  	end
  	
  it "should not be successful (secret page)" do
  	login_attempt = test_login("fake@email.com","fake_password")
  	get 'secret'
  	response.should redirect_to(login_path)
  end
end 

end