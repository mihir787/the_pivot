class UserNotifier < ApplicationMailer
  default from: "mihir787@gmail.com"

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: "Thanks for signing up for with Phonatic")
  end

  def order_confirmation(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order has been received')
  end

  def send_store_admin(user)
    @user = user
    mail(to: @user.email,
         subject: "You have been added as a Store Admin for #{@user.store}")
  end
end
