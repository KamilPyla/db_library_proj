module ReadersHelper
  def select_reader 
    Reader.all.map do |reader|
      [reader.name, reader.id]
    end
  end

  def book_status(rent)
    rent.data_oddania.nil? ? 'Wypozyczona' : 'Oddana'
  end

  def employee_rent(rent)
    rent.employee_rent_id.nil? ? 'Samodzielnie' : rent.employee_rent.name
  end
end

