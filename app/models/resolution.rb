class Resolution < ActiveRecord::Base
  attr_accessible :resolution_text, :title

	validates :title, :resolution_text, :presence => true
	validates :title, :length => {:minimum => 5, :maximum => 140}
  validates :title, :uniqueness => {:message => "Es gab bereits einen Umlaufbeschluss mit diesem Titel"}

	has_many :votes

end
