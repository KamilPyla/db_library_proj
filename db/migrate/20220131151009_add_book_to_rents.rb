class AddBookToRents < ActiveRecord::Migration[6.1]
  def change
    add_reference :rents, :book, index: true, foreign_key: true
  end
end
