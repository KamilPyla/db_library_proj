json.extract! employee, :id, :login, :haslo, :data_urodzenia, :imie, :nazwisko, :created_at, :updated_at
json.url employee_url(employee, format: :json)
