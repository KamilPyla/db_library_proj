class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :nazwa
      t.float :wyplata

      t.timestamps
    end
  end
end
