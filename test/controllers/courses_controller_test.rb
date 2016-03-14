require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { code: @course.code, comment: @course.comment, continuity_id: @course.continuity_id, credits: @course.credits, description: @course.description, id: @course.id, indepedent_study: @course.indepedent_study, name: @course.name, subjects: @course.subjects, term: @course.term, text: @course.text }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @course, course: { code: @course.code, comment: @course.comment, continuity_id: @course.continuity_id, credits: @course.credits, description: @course.description, id: @course.id, indepedent_study: @course.indepedent_study, name: @course.name, subjects: @course.subjects, term: @course.term, text: @course.text }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
