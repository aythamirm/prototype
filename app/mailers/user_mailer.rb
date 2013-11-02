class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Please, check all the task and project').deliver
  end
end
