class User < ActiveRecord::Base
    has_secure_password
    has_many :favorites
    has_many :answers

    validates_presence_of :email
    validates_uniqueness_of :email
end
