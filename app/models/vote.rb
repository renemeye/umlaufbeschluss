class Vote < ActiveRecord::Base
  attr_accessible :invite_code, :voting, :resolution, :membership

	validates :invite_code, :presence => true
	validates :invite_code, :uniqueness => true
	validates_inclusion_of :voting, :in => %w( yes no abstention notVoted ), :message => "Wrong value for vote."

  belongs_to :resolution
	belongs_to :membership
	has_one :person, :through => :membership
	has_one :board, :through => :membership
end
