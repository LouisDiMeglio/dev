# Preview all emails at http://localhost:3000/rails/mailers/course_mailer
class UserMailerPreview < ActionMailer::Preview
  def signup_email
    # create test data to pass into email
    @user = User.new user_name: "Midas", email: "puregold@gmail.com", password: "Kazamo"
    # call the mailer and the email we want to test
    UserMailer.signup_email @user
  end
end
