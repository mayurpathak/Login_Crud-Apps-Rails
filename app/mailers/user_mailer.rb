class UserMailer < ApplicationMailer
default :from => "mayurpathak888@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_password.subject
  #
  def forgot_password(user)
    @user = user
   @greeting = "Hi"

   mail to: user.email, :subject => 'Reset password instructions'
  end

  def test_send(email)
  @email = email
  mail(to: @email, subject: 'Test Send')
end
end
