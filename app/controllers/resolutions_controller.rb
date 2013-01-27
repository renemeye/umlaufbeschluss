class ResolutionsController < ApplicationController
	def index
		@resolutions = Resolution.all
	end

	def show
		@resolution = Resolution.find(params[:id])
	end

	def new
		@resolution = Resolution.new
	end

	def create
		@resolution = Resolution.new(params[:resolution])

		if @resolution.save
			redirect_to resolutions_path, :notice => "Your resolution has started"
		else
			render "new"
		end
	end

	def edit
		@resolution = Resolution.find(params[:id])
	end

	def update
  	@resolution = Resolution.find(params[:id])

		if @resolution.update_attributes(params[:resolution])
			redirect_to resolutions_path, :notice => "Your resolution has been updated"
		else
			render "edit"
		end

	end

	def destroy
		@resolution = Resolution.find(params[:id])
		@resolution.destroy
		redirect_to resolutions_path, :notice => "Der Umlaufbeschluss '"+@resolution.title+"' wurde geloescht"
	end

end
