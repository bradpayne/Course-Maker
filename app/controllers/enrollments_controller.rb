class EnrollmentsController < ApplicationController

  def new
    @enrollmenet = Enrollmenet.new
  end

  def create
    @enrollment = Activity.new(activity_params)

    if @enrollment.save
      flash[:notice] = 'Enrolled!'
      redirect_to events_path
    else
      flash.now[:warning] = 'There were problems when trying to add the users'
      render :action => :new
    end
  end

  def index
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity }
    end
  end

  def destroy 

  end 

  private
 # Use callbacks to share common setup or constraints between actions.

    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:user_id, :course_id)
    end
end

