json.extract! book, :id, :tytul, :rok_wydania, :opis, :created_at, :updated_at
json.url book_url(book, format: :json)
