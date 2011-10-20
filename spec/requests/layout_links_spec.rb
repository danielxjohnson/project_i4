require 'spec_helper'

describe "LayoutLinks" do
	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end

	it "should have a Home page at '/secret'" do
		get '/secret'
		response.should have_selector('title', :content => "Secret")
	end

	it "should have a sign up page at '/signup'" do
		get '/signup'
		response.should have_selector('title', :content => "Sign Up")
	end
end