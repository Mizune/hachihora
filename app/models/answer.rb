class Answer < ActiveRecord::Base
    has_many :favorites
    belongs_to :quiz
    belongs_to :user
end
