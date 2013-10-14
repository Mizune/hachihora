class User < ActiveRecord::Base
    has_secure_password
    has_many :favorites
    has_many :answers
end
