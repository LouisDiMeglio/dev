class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers
  has_many :response
end