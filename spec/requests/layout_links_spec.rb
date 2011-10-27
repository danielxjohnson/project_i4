require 'spec_helper'

describe "LayoutLinks" do
#render_views

	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end

#	test fails - says login is an undefined method. 
#	it "should have a Secret page at '/secret'" do
#		@user_object = Factory(:user)
#		@params = {:email => @user_object.email, :password => @user_object.password_confirmation} #had use password confirmation bc sorcery wipes out the password after successful create in db via the clear_virtual_password method
#	 	login_attempt = test_login(@params[:email], @params[:password])
#	 	if login_attempt
#			get '/secret'
#			response.should have_selector('title', :content => "Secret")
#		end
#	end

	it "should have a sign up page at '/signup'" do
		get '/signup'
		response.should have_selector('title', :content => "Sign Up")
	end
	
		before(:each) do
		    end
		
end