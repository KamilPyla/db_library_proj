class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.date :planowana_data_oddania
      t.date :data_wypozyczenia
      t.date :data_oddania

      t.timestamps
    end
  end
end
