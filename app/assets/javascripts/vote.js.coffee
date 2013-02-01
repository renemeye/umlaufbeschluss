# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ -> $(".myVoteBtn").click (event) -> 
	button = $(event.currentTarget)
	$("tr.myVote").removeClass("info error success").addClass votingToBootstrapClass button.attr("value")

votingToBootstrapClass = (voting) -> 
	switch voting
		when "yes" 
			"success"
		when "no"
			"error"
		when "abstention"
			"info"
		else
			voting


