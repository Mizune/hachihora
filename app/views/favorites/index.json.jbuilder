json.array!(@favorites) do |favorite|
  json.extract! favorite, :user_id, :answer_id
  json.url favorite_url(favorite, format: :json)
end
