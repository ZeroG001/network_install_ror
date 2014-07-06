require 'test_helper'

class NetFormsControllerTest < ActionController::TestCase
  setup do
    @net_form = net_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:net_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create net_form" do
    assert_difference('NetForm.count') do
      post :create, net_form: { antivir_expire_date: @net_form.antivir_expire_date, antivir_type: @net_form.antivir_type, complete_date: @net_form.complete_date, completed: @net_form.completed, computer_name: @net_form.computer_name, email: @net_form.email, equipment_type: @net_form.equipment_type, first_name: @net_form.first_name, last_name: @net_form.last_name, nic_connection: @net_form.nic_connection, os_type: @net_form.os_type, paynum: @net_form.paynum, phone_number: @net_form.phone_number, service_cost: @net_form.service_cost, technician_name: @net_form.technician_name }
    end

    assert_redirected_to net_form_path(assigns(:net_form))
  end

  test "should show net_form" do
    get :show, id: @net_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @net_form
    assert_response :success
  end

  test "should update net_form" do
    patch :update, id: @net_form, net_form: { antivir_expire_date: @net_form.antivir_expire_date, antivir_type: @net_form.antivir_type, complete_date: @net_form.complete_date, completed: @net_form.completed, computer_name: @net_form.computer_name, email: @net_form.email, equipment_type: @net_form.equipment_type, first_name: @net_form.first_name, last_name: @net_form.last_name, nic_connection: @net_form.nic_connection, os_type: @net_form.os_type, paynum: @net_form.paynum, phone_number: @net_form.phone_number, service_cost: @net_form.service_cost, technician_name: @net_form.technician_name }
    assert_redirected_to net_form_path(assigns(:net_form))
  end

  test "should destroy net_form" do
    assert_difference('NetForm.count', -1) do
      delete :destroy, id: @net_form
    end

    assert_redirected_to net_forms_path
  end
end
