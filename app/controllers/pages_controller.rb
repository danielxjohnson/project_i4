class PagesController < ApplicationController
  def home
  	@title = "Home"
  end
  
  def secret
  	@title = "Secret"
  end  

end
