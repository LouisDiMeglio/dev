json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :title, :published, :posted_on
  json.url quiz_url(quiz, format: :json)
end
