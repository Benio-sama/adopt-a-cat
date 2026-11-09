module ApplicationHelper
  def logged_in?
    session[:user].present?
  end

  def current_user
    @session_user
  end

  def is_admin?
    false
  end
end
