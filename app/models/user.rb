class User < ActiveRecord::Base
	has_secure_password
	validates(:email, presence: true)

	has_many :lists

	has_many :tasks
end
