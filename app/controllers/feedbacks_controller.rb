class FeedbacksController < ApplicationController
  def index
    name = user_signed_in? ? current_user.name : nil
    @feedback = Feedback.new(name: name)
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbackServiceMailer.new_feedback(@feedback.name, @feedback.message).deliver_later
      redirect_to root_url, notice: 'Thanks for your feedback!'
    else
      render :index, status: 400
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :message)
  end
end
