json.array!(@bookcases) do |bookcase|
  json.extract! bookcase, :id, :description, :shelves_count
  json.url bookcase_url(bookcase, format: :json)
end
