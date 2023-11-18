class MessageMailer < ApplicationMailer
    def send_message(message)
        @message = message
        mail(from: ENV['MAIL_FROM'], to: @message.receiver_email, subject: @message.subject)
    end
end
