module ApplicationHelper
  def logged_in?
    true
  end

  def current_user
    @current_user ||= User.new(id: 1, name: "test", email: "test@test.hu")
  end
end
