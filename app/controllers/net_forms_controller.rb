class NetFormsController < ApplicationController
  before_action :set_net_form, only: [:show, :edit, :update, :destroy]
 

  # GET /net_forms
  # GET /net_forms.json
  def index
    @net_forms = NetForm.where("completed = 0")
  end

  # GET /net_forms/1
  # GET /net_forms/1.json
  def show

  end

  def advsearch
    # Trying to figure how to make a dynemic query
    def buildQuery(block)
      block.reject!{|k, v| k == "utf8" or k == "action" or k == "controller" or v.match(/\s/) or v == ""}
      
      i = 1
      q = ""

      block.each do |k,v|
        if (i == block.size)
          q = q + "#{k} LIKE ?"
        else
          q = q + "#{k} LIKE ? AND "
        end
          i = i + 1
        end
      return q
    end

    def buildParams(block)
      block.reject!{|k, v| k == "utf8" or k == "action" or k == "controller" or v.match(/\s/) or v == ""}
      p = []
      block.each {|k, v| p = p + ["%#{v}%"]}    
      return p
    end
    # cquery2 = buildQuery params
    queryString = buildQuery params
    queryParams = buildParams params
    
    @net_forms = NetForm.where(queryString, *queryParams).take(50)
    #@test_array = params.reject!{|k, v| k == "utf8" or k == "action" or k == "controller" or v.match(/\s/) or v == ""}
    # full_name = "%#{params[:full_name]}%"
    # @net_forms = NetForm.where("concat(first_name,' ',last_name) LIKE ? AND completed = ?",full_name, params[:completed])
    # @net_forms = @net_forms.first_names(params[:first_name]) if params[:first_name].present?
    # @net_forms = @net_forms.last_name(params[:last_name]) if params[:last_name].present?
    # @net_forms = @net_forms.completed
  end


  #This section may need refactoring. Regular expression using deprecated way to detect empty space
  def search

   
      @net_forms = NetForm.all
    
    if (params[:full_name] == /^ +$/ or params[:full_name] == "") 
       full_name = "#{params[:full_name]}"
    else
      full_name = "%#{params[:full_name]}%"
    end

    if (params[:cpu_name] == /^ +$/ or params[:cpu_name] == "") 
       cpu_name = "#{params[:cpu_name]}"
    else
      cpu_name = "%#{params[:cpu_name]}%"
    end

    if params[:full_name] 
      @net_forms = NetForm.where("concat(first_name,' ',last_name) LIKE ?",full_name);
    elsif params[:cpu_name]
      @net_forms = NetForm.where("computer_name LIKE ?", cpu_name)
    end
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
      format.html { redirect_to search_url }
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
      params.require(:net_form).permit(:first_name, :last_name, :service_cost, :equipment_type, :nic_connection, :os_type, :antivir_type, :paynum, :complete_date, :completed, :email, {printer_ip: []}, :phone_number, :computer_name, :antivir_expire_date, :technician_name, :office_number)
    end

    
end
