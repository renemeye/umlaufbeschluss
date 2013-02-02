class Resolution < ActiveRecord::Base
  attr_accessible :resolution_text, :title, :board_id, :reasons, :requestor

	validates :title, :resolution_text, :presence => true
	validates :title, :length => {:minimum => 5, :maximum => 140}
  validates :title, :uniqueness => {:message => "Es gab bereits einen Umlaufbeschluss mit diesem Titel"}

	has_many :votes
	belongs_to :board

	def result_numbers
		voteCount = self.votes.count
		yesCount = 0.0
		noCount = 0.0
		abstentionCount = 0.0
		notVoted = 0.0

		self.votes.each do |vote|
			case vote.voting
				when "yes"
					yesCount+=1.0
				when "no"
					noCount+=1.0
				when "abstention"
					abstentionCount+=1.0
				when "notVoted"
					notVoted+=1.0
				else
					raise "Wrong voting type"
			end
		end
		
		if voteCount == 0 || (voteCount-abstentionCount) == 0
			return {
					:yes => 0.0, 
					:no => 0.0, 
					:yesQuorum => 0.0,
					:noQuorum => 0.0,
					:abstentionQuorum => voteCount%1,
					:yesCount => 0,
					:noCount => 0,
					:abstentionCount => voteCount,
					:notVotedCount => 0,
					:votedCount => voteCount
			}
		end

		return {
				:yes => yesCount/(voteCount-abstentionCount), 
				:no => noCount/(voteCount-abstentionCount), 
				:yesQuorum => yesCount/voteCount,
				:noQuorum => noCount/voteCount,
				:abstentionQuorum => abstentionCount/voteCount,
				:yesCount => yesCount,
				:noCount => noCount,
				:abstentionCount => abstentionCount,
				:notVotedCount => notVoted,
				:votedCount => voteCount-notVoted
		}
		
	end

	def result
		results = self.result_numbers

		return "yes" if results[:yes] > 0.5
		return "no"  if results[:no] > 0.5
		return "noResult"
	end
end
