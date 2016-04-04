class CourseSubjectController < ApplicationController

	
	
def create
    @cs = Course_subject.new(course_params)
end


private 

    def course_params
      params.require(:course_id, :subject_id)
    end
end
