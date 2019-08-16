module ApplicationHelper

  def logged_in?
    current_user != nil
  end

  def isAdmin?
    logged_in? && current_user.isAdmin === true
  end

end
