class Resolution < ActiveRecord::Base
  attr_accessible :resolution_text, :title

	validates :title, :resolution_text, :presence => true
	validates :title, :length => {:minimum => 2, :maximum => 500}
  validates :title, :uniqueness => {:message => "Es gab bereits einen Umlaufbeschluss mit diesem Titel"}
end
