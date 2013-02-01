class PeopleController < ApplicationController
	def index
		return if you_shall_not_pass
		@people = Person.all
	end

	def show
		return if you_shall_not_pass
		@person = Person.find(params[:id])
	end

  def new
		return if you_shall_not_pass
    @person = Person.new
  end

  def create
		return if you_shall_not_pass

    @person = Person.new(params[:person])
		if @person.save
			redirect_to root_url, :notice => "Signed up!"
		else
			render "new"
		end
	end
end
