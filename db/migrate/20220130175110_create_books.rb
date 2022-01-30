class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :tytul
      t.date :rok_wydania
      t.text :opis

      t.timestamps
    end
  end
end
