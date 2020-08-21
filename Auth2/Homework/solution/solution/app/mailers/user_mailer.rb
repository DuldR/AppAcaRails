class UserMailer < ApplicationMailer
    default from: 'coolguy420@hotmail.com'

    def welcome_email(user)
        @user = user
        @url = 'http://goatse.com/'
        mail(to: user.username, subject: "WelCUM to the site.")
        
    end
end
