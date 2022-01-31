class AddEmployeesToRents < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :employee_rent_id, :integer, foreign_key: true
    add_column :rents, :employee_return_id, :integer, foreign_key: true
  end
end
