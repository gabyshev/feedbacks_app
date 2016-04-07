class FeedbackServiceMailer < ApplicationMailer
  default from: 'service@company.com'

  def new_feedback(name, message)
    @name = name
    @message = message
    mail(to: ENV['SUPPORT_EMAIL'], subject: 'New Feedback form User')
  end
end
