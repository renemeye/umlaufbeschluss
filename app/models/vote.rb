class Vote < ActiveRecord::Base

	 validates_inclusion_of :voting, :in => %w( yes no abstention notVoted ), :message => "Wrong value for vote."

  belongs_to :resolution
  attr_accessible :invite_code, :voting
end
