class ResolutionMailer < ActionMailer::Base
  default from: "Umlaufbeschluss <hostmaster@rene-meye.de>"

	def new_vote vote
		#return if you_shall_not_pass
		@vote = vote
		@person = vote.person
		@current_user = Person.first #current_user
		@resolution = vote.resolution
		mail(
			:to => @person.email, 
			:subject => "[Umlaufbeschluss] "+@resolution.title,
			"Message-ID" => @resolution.message_id
		)
	end

	def resolution_has_passed
		@resolution = vote.resolution
		mail(
			:to => @person.email, 
			:subject => "Re:[Umlaufbeschluss] "+@resolution.title,
			"Message-ID" => @resolution.message_id
		)
	end
end
