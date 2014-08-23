require 'test_helper'

class FormsControllerTest < ActionController::TestCase
  setup do
    @form = forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create net_form" do
    assert_difference('Form.count') do
      post :create, net_form: { antivir_expire_date: @form.antivir_expire_date, antivir_type: @form.antivir_type, complete_date: @form.complete_date, completed: @form.completed, computer_name: @form.computer_name, email: @form.email, equipment_type: @form.equipment_type, first_name: @form.first_name, last_name: @form.last_name, nic_connection: @form.nic_connection, os_type: @form.os_type, paynum: @form.paynum, phone_number: @form.phone_number, service_cost: @form.service_cost, technician_name: @form.technician_name }
    end

    assert_redirected_to net_form_path(assigns(:net_form))
  end

  test "should show net_form" do
    get :show, id: @form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form
    assert_response :success
  end

  test "should update net_form" do
    patch :update, id: @form, net_form: { antivir_expire_date: @form.antivir_expire_date, antivir_type: @form.antivir_type, complete_date: @form.complete_date, completed: @form.completed, computer_name: @form.computer_name, email: @form.email, equipment_type: @form.equipment_type, first_name: @form.first_name, last_name: @form.last_name, nic_connection: @form.nic_connection, os_type: @form.os_type, paynum: @form.paynum, phone_number: @form.phone_number, service_cost: @form.service_cost, technician_name: @form.technician_name }
    assert_redirected_to net_form_path(assigns(:net_form))
  end

  test "should destroy net_form" do
    assert_difference('Form.count', -1) do
      delete :destroy, id: @form
    end

    assert_redirected_to forms_path
  end
end
