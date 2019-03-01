class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @mission = Mission.find(params[:mission_id])
  end

  def create
    @mission = Mission.find(params[:mission_id])
    @review = Review.new(review_params)
    @review.mission = @mission
    @review.user = current_user
    if @review.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:transparency, :social_impact, :staff_note, :content)
  end
end
