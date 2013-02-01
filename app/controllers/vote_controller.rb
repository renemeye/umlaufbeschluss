class VoteController < ApplicationController

	def index
		@votes = Vote.all
	end

	def edit
		@vote = Vote.find(params[:id])
	end

end
