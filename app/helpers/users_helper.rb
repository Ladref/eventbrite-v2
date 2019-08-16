module UsersHelper


  def isAdmin?
    logged_in? && current_user.isAdmin === true
  end

end
