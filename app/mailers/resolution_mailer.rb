class ResolutionMailer < ActionMailer::Base
  default from: "Umlaufbeschluss <hostmaster@rene-meye.de>"

	def new_vote vote
		#return if you_shall_not_pass
		@vote = vote
		@person = vote.person
		@current_user = Person.first #current_user
		@resolution = vote.resolution
		mail(:to => @person.email, :subject => "[Umlaufbeschluss] "+@resolution.title)
	end
end
