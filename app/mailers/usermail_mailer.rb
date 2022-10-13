class UsermailMailer < ApplicationMailer
    def welcome
        @book = params[:book_id]
        mail(to: "vish75810@gmail.com", subject: "Welcome to Mailer")
    end
end
