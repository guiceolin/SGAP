class User < ActiveRecord::Base
  attr_accessible :crypted_password, :email, :salt, :username
end
