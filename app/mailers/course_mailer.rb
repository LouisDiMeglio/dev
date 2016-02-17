class CourseMailer < ApplicationMailer
  default from: "from@example.com"

  def signup(user)
    @user = user
    mail(to: @user.email, subject: 'Sign up for QuizKnows')
  end
end
