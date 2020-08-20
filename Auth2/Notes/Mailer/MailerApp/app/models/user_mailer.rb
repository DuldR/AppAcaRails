class UserMailer < ApplicationRecord
    
    def welcome_email

        attachments['filename.jpg'] = File.read('/path/to/thefile')

    end
end