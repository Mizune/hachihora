class User < ActiveRecord::Base
    has_many :favorites
    has_many :answers
end
