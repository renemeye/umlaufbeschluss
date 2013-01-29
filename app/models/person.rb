class Person < ActiveRecord::Base
  attr_accessible :email, :name, :password

	validates :email, :name, :password, :presence => true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
  validates :email, :uniqueness => true 

	has_many :memberships
	has_many :boards, :through => :memberships
end
