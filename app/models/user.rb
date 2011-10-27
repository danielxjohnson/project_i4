class User < ActiveRecord::Base
 	authenticates_with_sorcery!
  
  	attr_accessible :email, :password, :password_confirmation

 	validates_confirmation_of :password
  	validates_presence_of :password, :on => :create
  	validates_presence_of :email
  	validates_uniqueness_of :email
  	
  	      def clear_virtual_password
        config = sorcery_config
        #self.send(:"#{config.password_attribute_name}=", nil)
      end
end