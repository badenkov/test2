# encoding=utf-8
class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_message_notification(user, message)
    @user = user
    @message = message
    mail(to: user.email, subject: 'Поступило новое сообщение')
  end
end
