require 'test_helper'

class CourseMailerTest < ActionMailer::TestCase
  test "signup" do
    # Send email then test that it got queued
    # email = CourseMailer.create_signup('from@example.com', 'course.students.pluck(:email)', Time.now).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
      asssert_equal ['from@example.com'], email.from
      asssert_equal ['course.students.pluck(:email)'], email.to
  end
end
