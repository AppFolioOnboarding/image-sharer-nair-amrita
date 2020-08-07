module Api
  class FeedbacksController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
      feedback = Feedback.new(feedback_params)
      if feedback.save
        render json: { message: 'Feedback submitted!' }, status: :created
      else
        render json: { message: 'Could not save feedback!' }, status: :internal_server_error
      end
    end

    def new; end

    private

    def feedback_params
      params.require(:feedback).permit(:name, :comments)
    end
  end
end
