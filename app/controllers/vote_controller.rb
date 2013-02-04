class VoteController < ApplicationController

	def index
		@votes = Vote.all
	end

	def edit
		@vote = Vote.find(params[:id])

		unless params[:invite_code] == @vote.invite_code || current_user == @vote.person 
			redirect_to resolution_path(@vote.resolution.id), :notice => "Du musst eingeloggt sein"
			return 
		end
	end

	def update
  	@vote = Vote.find(params[:id])

		if @vote.update_attributes(params[:vote])
			@vote.update_attribute(:invite_code,"")
			redirect_to resolution_path(@vote.resolution.id)
		else
			render 'edit'
		end
	end

end
