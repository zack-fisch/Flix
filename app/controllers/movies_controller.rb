class MoviesController < ApplicationController

	def index
		@movies = ['Iron Man', 'Superman', 'Spider-Man', 'Saving Private Ryan']
	end

end
