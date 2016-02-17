FactoryGirl.define do
  factory :quiz do
    title { Faker::Lorem.word }
    user_id 1
    published true
  end

  # This will use the User class (Admin would have been guessed)
  factory :course do
    title { Faker::Lorem.word }
  end
end
