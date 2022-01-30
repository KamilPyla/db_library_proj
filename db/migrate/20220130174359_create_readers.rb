class CreateReaders < ActiveRecord::Migration[6.1]
  def change
    create_table :readers do |t|
      t.string :imie
      t.string :nazwisko
      t.string :telefon
      t.date :data_urodzenia
      t.string :email
      t.string :haslo

      t.timestamps
    end
  end
end
