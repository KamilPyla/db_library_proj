module ApplicationHelper
  USER_TYPE = { 'Reader' => 'Czytelnik', 'Employee'=> 'Pracownik', 'Admin'=> 'Administrator' }

  def session_type
    return USER_TYPE[session[:user_type]] if current_user

    'Wylogowano'
  end
end
