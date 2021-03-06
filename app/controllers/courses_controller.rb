class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
  end

  def search 
    @courses = Course.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    @subjects = Array.new(10) { "" }

    #@subjects = Subjects.all.map {|c| [c.name, c.id]}
    #@subject = [["any", 0]] + @subjects
    #@courses = nil
  end 

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def enroll
      set_course
      current_user.courses << @course
      redirect_to @course, notice: 'You joined this class!'
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:id, :comment, :term, :code, :subjects, :continuity_id, :name, :description, :credits, :indepedent_study)
    end

    def sort_column
      Course.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
