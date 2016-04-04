class CourseSubject < ActiveRecord::Base
	belongs_to :course
	belongs_to :subjects
end
