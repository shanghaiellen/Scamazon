class ReviewsController < ApplicationController
  before_action :check_login
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      # success
      redirect_to review_path(@review)
    else
      # failure
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
   @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to :action => 'show', :id => @review, notice: "Your review has been successfully updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to new_review_path, notice: "Review has been successfully deleted."
  end


  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:review_text, :text, :rating, :integer)
  end

  def check_login
    if @current_user.nil?
      # this feature does not allow users to create a review unless logged in.
      redirect_to new_session_path, notice: "You must login!" and return
    end
  end
end
