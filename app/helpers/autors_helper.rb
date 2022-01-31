module AutorsHelper
  def select_autor
    Autor.all.map do |autor|
      [autor.name, autor.id]
    end
  end
end
