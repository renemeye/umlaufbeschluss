class Board < ActiveRecord::Base
  attr_accessible :name
	has_many :memberships
	has_many :persons, :through => :memberships
	has_many :resolutions
end
