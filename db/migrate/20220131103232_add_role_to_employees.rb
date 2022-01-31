class AddRoleToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :role, index: true, foreign_key: true
  end
end
