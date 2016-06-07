class UserMailer < ApplicationMailer
	 default from: 'no-reply@rebel-outpost.com'
  
 def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def notify_approval(user)
    @user = user
   @url  = 'http://railscrms.herokuapp.com/#'
    mail(to: @user.email, subject: 'RailsCRM Approval')
  end
end
