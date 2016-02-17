json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :email, :password, :temp_password, :type, :course_id, :complete_id
  json.url user_url(user, format: :json)
end
