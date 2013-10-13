json.array!(@quizzes) do |quiz|
  json.extract! quiz, :contents
  json.url quiz_url(quiz, format: :json)
end
