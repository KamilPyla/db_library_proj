class CreatePunishments < ActiveRecord::Migration[6.1]
  def change
    create_table :punishments do |t|
      t.float :kwota

      t.timestamps
    end
  end
end
