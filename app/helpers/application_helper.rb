module ApplicationHelper
  def store_admin?
    current_user && current_user.store_admin?
  end 
end
