class Membership < ActiveRecord::Base

  belongs_to :board
  belongs_to :person
  attr_accessible :from, :to
	has_many :votes
end
