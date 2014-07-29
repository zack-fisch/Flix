class ReviewsController < ApplicationController
	 before_action :require_signin
	 before_action :set_movie


	def index
		@reviews = @movie.reviews
	end

	def new
 	 @review = @movie.reviews.new
	end

	def create
		 @review = @movie.reviews.new(review_params)
		 @review.user = current_user
    if @review.save
      redirect_to movie_reviews_path(@movie), notice: 'Thanks for your review!'
    else 
      render :new
    end
	end

	def destroy
		@review = @movie.reviews.find(params[:id])
		@review.destroy
		redirect_to movies_path, notice: 'Review Deleted!'
	end

	def update
		@review = @movie.reviews.find(params[:id])
		if @review.update(review_params)
			redirect_to movie_reviews_path, notice: 'Review Updated!'
		else
			redirect_to :back, notice: 'Improper Review, Try Again!'
		end

	end

	def edit
		@review = @movie.reviews.find(params[:id])
	end


	private
	def review_params
		params.require(:review).permit(:comment, :stars)
	end

	def set_movie
		@movie = Movie.find(params[:movie_id])
	end
end
