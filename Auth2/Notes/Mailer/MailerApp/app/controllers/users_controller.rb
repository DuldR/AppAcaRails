class UsersController < ApplicationController

    def create

        u = User.create(user_params)
        msg = UserMailer.welcome_email(u)

        msg.deliver_now

        render :root

end