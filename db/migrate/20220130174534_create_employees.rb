class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :login
      t.string :haslo
      t.date :data_urodzenia
      t.string :imie
      t.string :nazwisko

      t.timestamps
    end
  end
end
