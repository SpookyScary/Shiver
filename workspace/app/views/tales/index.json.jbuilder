json.array!(@tales) do |tale|
  json.extract! tale, :id, :title, :text, :image
  json.url tale_url(tale, format: :json)
end
