require 'test_helper'

class CorrespondencesControllerTest < ActionController::TestCase
  setup do
    @correspondence = correspondences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:correspondences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create correspondence" do
    assert_difference('Correspondence.count') do
      post :create, correspondence: { additional_info: @correspondence.additional_info, comapny: @correspondence.comapny, contact_number: @correspondence.contact_number, designation: @correspondence.designation, email: @correspondence.email, first_name: @correspondence.first_name, industry: @correspondence.industry, last_name: @correspondence.last_name, location: @correspondence.location }
    end

    assert_redirected_to correspondence_path(assigns(:correspondence))
  end

  test "should show correspondence" do
    get :show, id: @correspondence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @correspondence
    assert_response :success
  end

  test "should update correspondence" do
    patch :update, id: @correspondence, correspondence: { additional_info: @correspondence.additional_info, comapny: @correspondence.comapny, contact_number: @correspondence.contact_number, designation: @correspondence.designation, email: @correspondence.email, first_name: @correspondence.first_name, industry: @correspondence.industry, last_name: @correspondence.last_name, location: @correspondence.location }
    assert_redirected_to correspondence_path(assigns(:correspondence))
  end

  test "should destroy correspondence" do
    assert_difference('Correspondence.count', -1) do
      delete :destroy, id: @correspondence
    end

    assert_redirected_to correspondences_path
  end
end
