class EventMailer < ActionMailer::Base

  def event_created(title, usermail)
    @title = title
    @usermail = usermail
    mail(to: @usermail,
         from: "emergencyinteract.ucsb@gmail.com",
         subject: "Emergency Notification from EmergencyInteract",
         body: @title
    )
  end

end
