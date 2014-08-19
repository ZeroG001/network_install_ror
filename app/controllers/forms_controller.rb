class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 

  # GET /forms
  # GET /forms.json
  def index
    if current_user.try(:role) == "admin"
      @forms = Form.where("completed = 0")
    else
      # User.find(current_user).forms
      @forms = Form.where("user_id = ? OR paynum = ?", current_user.id, current_user.paynum)
      
    end
    #
  end

  # GET /forms/1
  # GET /forms/1.json
  def show

  end

  def advsearch_form
    @form = Form.new
  end

  def advsearch
    @form = Form.new
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
    
    @forms = Form.where(queryString, *queryParams).take(50)
    if params.empty?
      @forms = params;
    end
    #@test_array = params.reject!{|k, v| k == "utf8" or k == "action" or k == "controller" or v.match(/\s/) or v == ""}
    # full_name = "%#{params[:full_name]}%"
    # @forms = Form.where("concat(first_name,' ',last_name) LIKE ? AND completed = ?",full_name, params[:completed])
    # @forms = @forms.first_names(params[:first_name]) if params[:first_name].present?
    # @forms = @forms.last_name(params[:last_name]) if params[:last_name].present?
    # @forms = @forms.completed
  end


  #This section may need refactoring. Regular expression using deprecated way to detect empty space
  def search
@test = params

# Array of possible params that can be submitted by the form.
def search_by

end

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


    if current_user.try(:role) == "manager"
      @forms = Form.where("office_number = ?", current_user.office_number)
    elsif current_user.try(:role) == "admin"
      @forms = Form.all 
    end
        
     

    # DIfferent queries depending on whos logged in
    if params[:full_name] 
      if current_user.try(:role) == "manager"
         @forms = Form.where("concat(first_name,' ',last_name) LIKE ? AND office_number = ? ",full_name, current_user.office_number );
      elsif current_user.try(:role) == "admin"
        @forms = Form.where("concat(first_name,' ',last_name) LIKE ?",full_name);
      end

    elsif params[:cpu_name]
      if current_user.try(:role) == "manager"
         @forms = Form.where("computer_name LIKE ? AND office_number = ? ",cpu_name, current_user.office_number );
      elsif current_user.try(:role) == "admin"
        @forms = Form.where("computer_name LIKE ?", cpu_name);
      end
    end

  end #end search controller

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)
    @form.user_id = current_user.id

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Net form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @form }
      else
        format.html { render action: 'new' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Net form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to search_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:user_id, :first_name, :last_name, :service_cost, :equipment_type, :nic_connection, :os_type, :antivir_type, :paynum, :complete_date, :completed, :email, {printer_ip: []}, :phone_number, :computer_name, :antivir_expire_date, :technician_name, :office_number)
    end

    
end
