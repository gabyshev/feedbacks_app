class FeedbacksController < ApplicationController
  def index
    name = user_signed_in? ? current_user.name : nil
    @feedback = Feedback.new(name: name)
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      redirect_to root_url, notice: 'Ok'
    else
      render :index, status: 400
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :message)
  end
end
