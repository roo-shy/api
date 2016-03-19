class User < ActiveRecord::Base

has_secure_password #validations for all the password stuff
validates :username, presence: true

end
