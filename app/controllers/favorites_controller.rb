class FavoritesController < ApplicationController
	before_action :require_signin
	before_action :set_movie

	def create
		@movie = Movie.find(params[:movie_id])
		favorite = @movie.favorites.build(user: current_user)
		if favorite.save
			redirect_to @movie, notice: 'Thanks for favoriting!'
		else
			redirect_to @movie, notice: 'something went wrong'
		end
	end

	def destroy
		
		favorite = current_user.favorites.find(params[:id])
		if favorite.destroy
			redirect_to @movie, notice: 'Movie successfully unfaved'
		else
			redirect_to @movie, notice: 'something went wrong'
	end
end

	private
	def set_movie
		@movie = Movie.find(params[:movie_id])
	end
end
