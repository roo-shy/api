class User < ActiveRecord::Base

has_secure_password #validations for all the password stuff
has_many :posts, dependent: :destroy
validates :username, presence: true

## Remove the uniqueness validation so I can re-run `api-runner.rb` while testing.

end
