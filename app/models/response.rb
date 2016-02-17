class Response < ActiveRecord::Base
  has_many :answers
  accepts_nested_attributes_for :answers
  belongs_to :user
  belongs_to :quiz
  belongs_to :question
end
