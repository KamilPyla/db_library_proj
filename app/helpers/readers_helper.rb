module ReadersHelper
  def select_reader 
    Reader.all.map do |reader|
      [reader.name, reader.id]
    end
  end
end
