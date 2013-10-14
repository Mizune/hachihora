class Quiz < ActiveRecord::Base
    has_many :answers

    validates_presence_of :contents
end
