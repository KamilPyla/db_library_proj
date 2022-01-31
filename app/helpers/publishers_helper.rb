module PublishersHelper
  def select_publisher
    Publisher.all.map do |publish|
      [publish.nazwa, publish.id]
    end
  end
end
