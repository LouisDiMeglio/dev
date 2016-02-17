# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.create(title: "Intro to tests")
User.create(user_name: "admin", email: "admin@example.com", password: "admin", type: "Instructor", course_id: 1)
User.create(user_name: "student", email: "student@example.com", password: "student", type: "Student", course_id: 1)
Quiz.create(title: "Quiz 1", published: true, posted_on: "02/10/2016", course_id: 1, user_id: 1)
Quiz.create(title: "Quiz 1", published: true, posted_on: "02/10/2016", course_id: 1, user_id: 2)
UserCourse.create(user_id: 1, course_id: 1)
UserCourse.create(user_id: 2, course_id: 1)


