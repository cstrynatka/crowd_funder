module UsersHelper

# before_filter :current_user

  def current_user=(user)
    Project.current_user = current_user
  end

end
