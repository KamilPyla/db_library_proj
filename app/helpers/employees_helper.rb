module EmployeesHelper
  def select_employee
    Employee.all.map do |employee|
      [employee.name, employee.id]
    end
  end
end
