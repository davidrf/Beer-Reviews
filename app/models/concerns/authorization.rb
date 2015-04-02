module Authorization
  def amendable?(logged_in_user)
    logged_in_user == user || logged_in_user.admin?
  end
end
