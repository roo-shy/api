class User < ActiveRecord::Base
has_many :posts, dependent: :destroy
validates :username, presence: true
has_secure_password

## Remove the uniqueness validation so I can re-run `api-runner.rb` while testing.
# validates :username, uniqueness: true
end
