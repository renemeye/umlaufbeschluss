class Membership < ActiveRecord::Base
  attr_accessible :from, :to

  belongs_to :board
  belongs_to :person
	has_many :votes
end
