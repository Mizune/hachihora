json.array!(@answers) do |answer|
  json.extract! answer, :contents, :user_id, :quiz_id
  json.url answer_url(answer, format: :json)
end
