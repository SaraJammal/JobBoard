class NotifierMailer < ApplicationMailer

  def simple_message(recipient)
    mail(
        to: user.email,
                 subject: "Job application",
                 content_type: "text/html",
                 body: "<html><strong>Greetings, This email is notify you that your job application has been viewed </strong></html>"
    )
    end
end
