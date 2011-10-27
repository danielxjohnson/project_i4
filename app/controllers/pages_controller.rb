class PagesController < ApplicationController
before_filter :require_login, :only => :secret

  def home
  	@title = "Home"
  end
  
  def secret
  	@title = "Secret"
  end  

  
end
