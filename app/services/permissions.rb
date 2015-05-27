class Permissions
  attr_reader :user, 
              :controller,
              :action

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action, store_id = nil)
    @controller = controller
    @action = action

    if user.platform_admin?
      platform_admin_permissions
    elsif user.store_admin?(store_id)
      store_admin_permissions
    elsif user.registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

  def platform_admin_permissions
    return true if controller == 'photos'
    return true if controller == 'users'
    return true if controller == 'orders'
    return true if controller == 'stores'
    return true if controller == 'sessions'
  end

  def store_admin_permissions
    return true if controller == 'stores/admin/stores'
    return true if controller == 'stores/admin/photos'
    return true if controller == 'photos'
    return true if controller == 'orders'
    return true if controller == 'stores'
    return true if controller == 'sessions'
  end

  def registered_user_permissions
    return true if controller == 'users'
    return true if controller == 'user/orders'
    return true if controller == 'user/downloads'
    return true if controller == 'stores/photos' && action.in?(%w(index show))
    return true if controller == 'sessions'
    return true if controller == 'stores'
    return true if controller == 'checkouts'
    return true if controller == 'charges'
    return true if controller == 'orders'
  end

  def guest_user_permissions
    return true if controller == 'stores/photos' && action.in?(%w(index show))
    return true if controller == 'sessions'
    return true if controller == 'stores'
    return true if controller == 'checkouts'
    return true if controller == 'users'
  end
end