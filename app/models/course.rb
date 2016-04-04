class Course < ActiveRecord::Base

	has_many :enrollments
	has_many :users, :through => :enrollments
	has_many :subjects

	scope :search, ->(search) {  where('name LIKE ?', "%#{search}%") }

end
