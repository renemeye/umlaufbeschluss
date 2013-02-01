class Person < ActiveRecord::Base
	has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation

	validates_presence_of :password, :on => :create
	validates :email, :name, :presence => true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, :uniqueness => true 

	has_many :memberships
	has_many :boards, :through => :memberships
end
