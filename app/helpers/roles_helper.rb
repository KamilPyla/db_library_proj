module RolesHelper
  def select_role
    Role.all.map do |role|
      [role.nazwa, role.id]
    end << ['Brak stanowiska', '']
  end
end
