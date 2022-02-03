class RenameColumnEmployee < ActiveRecord::Migration[6.1]
  def change
    rename_column :employees, :login, :email
  end
end
