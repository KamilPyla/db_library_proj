class Rent < ApplicationRecord
  belongs_to :book
  belongs_to :reader
  belongs_to :employee_rent, class_name: 'Employee', foreign_key: 'employee_rent_id', optional: true
  belongs_to :employee_return, class_name: 'Employee', foreign_key: 'employee_return_id', optional: true

  scope :active, -> { where('data_oddania is NULL') }

  scope :after_term, -> { where('data_oddania is NULL and planowana_data_oddania < ?', Date.today) }

  def return_date
    return 'Książka nie została oddana' if data_oddania.nil?

    data_oddania
  end

end
