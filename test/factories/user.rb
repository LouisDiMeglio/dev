FactoryGirl.define do
  factory :student, class: User do
    user_name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password "asdf" 
    course_id 1
  end

  factory :instructor, class: User do
    user_name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    type "Instructor"
    course_id 1
  end
end
