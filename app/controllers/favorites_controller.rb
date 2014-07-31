class FavoritesController < ApplicationController
	before_action :require_signin
	before_action :set_movie

	def create
		@movie = Movie.find(params[:movie_id])
		@movie.favorites.create!(user: current_user)
		redirect_to @movie, notice: 'Thanks for favoriting!'
	end

	def destroy
		@movie = Movie.find_by(params[:id])
		favorite = current_user.favorites.find(params[:id])
		favorite.destroy
		redirect_to @movie, notice: 'Movie successfully unfaved'
	end

	private
	def set_movie
		@movie = Movie.find_by(params[:id])
	end
end
