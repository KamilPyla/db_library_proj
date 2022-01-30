class CreateAutors < ActiveRecord::Migration[6.1]
  def change
    create_table :autors do |t|
      t.string :imie
      t.string :nazwisko

      t.timestamps
    end
  end
end
