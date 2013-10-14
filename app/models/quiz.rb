class Quiz < ActiveRecord::Base
    has_one :answer

    validates_presence_of :contents
end
