class BoardsController < ApplicationController
	def index
		return if you_shall_not_pass
		@Boards = Board.all
	end
	
	def show
		return if you_shall_not_pass
		@board = Board.find(params[:id])
	end

end
