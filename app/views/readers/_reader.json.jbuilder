json.extract! reader, :id, :imie, :nazwisko, :telefon, :data_urodzenia, :email, :haslo, :created_at, :updated_at
json.url reader_url(reader, format: :json)
