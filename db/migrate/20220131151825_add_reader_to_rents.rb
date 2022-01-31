class AddReaderToRents < ActiveRecord::Migration[6.1]
  def change
    add_reference :rents, :reader, index: true, foreign_key: true
  end
end
