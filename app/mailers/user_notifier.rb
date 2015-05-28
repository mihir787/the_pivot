class UserNotifier < ActionMailer::Base
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


  def order_to_store_admin(stores)
    stores.each do |store|
      store.users.each do |user|
        @user = user
        mail(to: @user.email,
             subject: "Someone has purchased photos from you")
      end
    end
  end

end
