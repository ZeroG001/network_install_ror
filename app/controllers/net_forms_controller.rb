class NetFormsController < ApplicationController
  before_action :set_net_form, only: [:show, :edit, :update, :destroy]

  # GET /net_forms
  # GET /net_forms.json
  def index
    @net_forms = NetForm.all
  end

  # GET /net_forms/1
  # GET /net_forms/1.json
  def show

  end

  # GET /net_forms/new
  def new
    @net_form = NetForm.new
  end

  # GET /net_forms/1/edit
  def edit
    @net_form = NetForm.find(params[:id])
  end

  # POST /net_forms
  # POST /net_forms.json
  def create
    @net_form = NetForm.new(net_form_params)

    respond_to do |format|
      if @net_form.save
        format.html { redirect_to @net_form, notice: 'Net form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @net_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @net_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net_forms/1
  # PATCH/PUT /net_forms/1.json
  def update
    respond_to do |format|
      if @net_form.update(net_form_params)
        format.html { redirect_to @net_form, notice: 'Net form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @net_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net_forms/1
  # DELETE /net_forms/1.json
  def destroy
    @net_form.destroy
    respond_to do |format|
      format.html { redirect_to net_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_net_form
      @net_form = NetForm.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def net_form_params
      params.require(:net_form).permit(:first_name, :last_name, :service_cost, :equipment_type, :nic_connection, :os_type, :antivir_type, :paynum, :complete_date, :completed, :email, {printer_ip: []}, :phone_number, :computer_name, :antivir_expire_date, :technician_name)
    end

    
end
