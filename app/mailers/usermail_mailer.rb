class UsermailMailer < ApplicationMailer
    def welcome
        mail(to: params[:email],subjects:"successfully")
    end    
end
