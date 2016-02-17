class Quiz < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :responses
  has_many :questions
end
