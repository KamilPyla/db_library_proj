class AddReaderToPunishments < ActiveRecord::Migration[6.1]
  def change
    add_reference :punishments, :reader, index: true, foreign_key: true
  end
end
