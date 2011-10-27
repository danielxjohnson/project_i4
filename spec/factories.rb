# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
    user.email                 "email@email.com"
    user.password              "projecti99"
    user.password_confirmation "projecti99"
    #user.remember_me			0
end  

Factory.sequence :email do |n|
        "email#{n}@example.com"

end

#Factory.define :micropost do |micropost|
#    micropost.content "Foo bar"
#    micropost.association :user
#end