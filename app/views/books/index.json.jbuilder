json.array!(@books) do |book|
  json.extract! book, :id, :name, :isbn, :published, :pages_count
  json.url book_url(book, format: :json)
end
