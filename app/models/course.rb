class Course < ActiveRecord::Base

	has_many :enrollments
	has_many :users, :through => :enrollments

	scope :search, ->(search) {  where('name LIKE ?', "%#{search}%") }

end
