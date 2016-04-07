class FeedbackServiceMailer < ApplicationMailer
  default from: 'service@company.com'

  def new_feedback(feedback)
    @feedback = feedback
    mail(to: ENV['SUPPORT_EMAIL'], subject: 'New Feedback form User')
  end
end
