class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_message_notification(user, message)
    @user = user
    @message = message
    logger.debug Сообщение .user.email
    mail(to: user.email, subject: 'Поступило новое сообщение')
  end
end
