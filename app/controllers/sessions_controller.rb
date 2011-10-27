class SessionsController < ApplicationController
  def create
  @title = "Log In"
  user = login(params[:email], params[:password], params[:remember_me])
  if user
    flash[:success] = "You are now signed in!"
    #flash[:success] = session[:return_to_url]
    #redirect_back_or_to root_url#, :notice => "Logged in!"
    #debugger
    redirect_back_or_to root_url
  else
    #flash.now.alert = "Email or password was invalid"
    flash.now[:error] = "Invalid Email or Password"
    render :new
  end
end

def destroy
  logout
  redirect_to root_url, :notice => "Logged out!"
end

def new
	@title = "Log In"
end


end
