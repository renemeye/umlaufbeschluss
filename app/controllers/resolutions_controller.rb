class ResolutionsController < ApplicationController
	def index
		@resolutions = Resolution.all(:order=>"created_at DESC")
	end

	def show
		@resolution = Resolution.find(params[:id])
	end

	def new
		return if you_shall_not_pass
		@resolution = Resolution.new
		@boards = Board.all
	end

	def create
		return if you_shall_not_pass

		@resolution = Resolution.new(params[:resolution])
		@boards = Board.all

		if @resolution.save
			votes = create_votes_for_new_resolution @resolution

			redirect_to resolutions_path, :notice => "Your resolution has started"
		else
			render "new"
		end
	end

	def edit
		return if you_shall_not_pass
		@resolution = Resolution.find(params[:id])
		@boards = Board.all
	end

	def update
		return if you_shall_not_pass

  	@resolution = Resolution.find(params[:id])

		if @resolution.update_attributes(params[:resolution])
			redirect_to resolutions_path, :notice => "Your resolution has been updated"
		else
			render "edit"
		end
	end

	def destroy
		return if you_shall_not_pass
		@resolution = Resolution.find(params[:id])
		@resolution.votes.each do |vote|
			vote.destroy
		end
		@resolution.destroy
		redirect_to resolutions_path, :notice => "Der Umlaufbeschluss '"+@resolution.title+"' wurde geloescht"
	end

########################################################################
private
	def create_votes_for_new_resolution resolution

		resolution.board.memberships.each do |membership|
			if membership.to == nil
			
				vote = Vote.new
				vote.resolution = resolution
				vote.membership = membership
				vote.voting = "notVoted"

				until vote.save do
					vote.invite_code = get_random_invite_code
				end

				ResolutionMailer.new_vote(vote).deliver

			end

		end
	end

	def get_random_invite_code
		o =  [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
		(0...12).map{ o[rand(o.length)] }.join
	end

end
