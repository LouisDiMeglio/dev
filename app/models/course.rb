class Course < ActiveRecord::Base
  has_many :user_courses
  has_many :users, :through  => :user_courses

  has_many :quizzes

  validates :title, presence: true
end
