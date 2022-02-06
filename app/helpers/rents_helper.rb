module RentsHelper
  def employee_rent(rent)
    rent.employee_rent_id.nil? ? 'Samodzielnie' : rent.employee_rent.name
  end

  def employee_return(rent)
    rent.employee_return_id.nil? ? 'Administrator' : rent.employee_return.name
  end
end
