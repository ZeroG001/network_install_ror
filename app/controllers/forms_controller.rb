class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # Pages Do no cache so when a user signs out. They stay signed out.
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
 

  # GET /forms
  # GET /forms.json
  def index

    if current_user.try(:role) == "admin"
      @forms = Form.where("completed = ?", "0").order(:created_at)
    elsif current_user.try(:role) == "manager"
      @forms = Form.where("office_number = ?", current_user.office_number).order(:created_at)
    else
      # User.find(current_user).forms
      @forms = Form.where("user_id = ? OR paynum = ?", current_user.id, current_user.paynum)
      
    end
    

  end

  # GET /forms/1
  # GET /forms/1.json
  def show

    if current_user.try(:role) == "agent"
      if current_user.paynum != @form.paynum and current_user.id != @form.user_id
        redirect_to root_url
      end
    end

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
          q = q + "#{k} ilike ?"
        else
          q = q + "#{k} ilike ? AND "
        end
          i = i + 1
        end

        # If a manager is signed in, add office number to the query for them. 
        # Since manager should only search for form in their office.
      if current_user.try(:role) == "manager"
        # Check to see if there are more than or less than 1 params. Finish SQL statement baseed on result.
        q = q + "AND office_number ilike ?" if block.size >= 1 
        q = q + "office_number ilike ?" if block.size < 1 
      end

      return q
    end

    def buildParams(block)
      block.reject!{|k, v| k == "utf8" or k == "action" or k == "controller" or v.match(/\s/) or v == ""}
      p = []
      block.each {|k, v| p = p + ["%#{v}%"]}

      # If the manager is signed in. Put in the office number for them
      if current_user.try(:role) == "manager"
        !p.push(current_user.office_number)
      end 

      return p
    end

    queryString = buildQuery params
    queryParams = buildParams params
    
    @forms = Form.where(queryString, *queryParams).take(50)
    if params.empty?
      @forms = params;
    end
    #@test_array = params.reject!{|k, v| k == "utf8" or k == "action" or k == "controller" or v.match(/\s/) or v == ""}
    # full_name = "%#{params[:full_name]}%"
    # @forms = Form.where("concat(first_name,' ',last_name) ilike ? AND completed = ?",full_name, params[:completed])
    # @forms = @forms.first_names(params[:first_name]) if params[:first_name].present?
    # @forms = @forms.last_name(params[:last_name]) if params[:last_name].present?
    # @forms = @forms.completed
  end


  #This section may need refactoring. Regular expression using deprecated way to detect empty space
  def search

    # this grabs the information submitted, cleans the exess stuff and leaves the input value.
    def get_param block
      block.reject!{|k, v| k == "utf8" or k == "action" or k == "controller"}
    end

    # set the value of the input fields key and value
    if params
      result = get_param params
      param_value = result.values[0]
      param_key = result.keys[0]

        if param_value == /^ +$/
          param_value = "#{}"
        else
          param_value = "%#{param_value}%"
        end
    end

      
      # If the manager is signed in, run certain search queries
        if current_user.try(:role) == "manager"
          @forms = Form.where("office_number = ?",current_user.office_number)

          if param_key == "full_name"
            @forms = Form.where("concat(first_name,' ',last_name) ilike ? AND office_number = ? ", param_value, current_user.office_number )
          elsif param_key == "cpu_name"
             @forms = Form.where("computer_name ilike ? AND office_number = ? ",param_value, current_user.office_number )
          elsif param_key == "paynum"
             @forms = Form.where("paynum ilike ? AND office_number = ?", param_value, current_user.office_number)
          end

        end

        # if the admin is signed in then run certain search queries
        if current_user.try(:role) == "admin"
          @forms = Form.all

          if param_key == "full_name"
           @forms = Form.where("concat(first_name,' ',last_name) ilike ?", param_value )
          elsif param_key == "cpu_name"
            @forms = Form.where("computer_name ilike ?", param_value)
          elsif param_key == "paynum"
             @forms = Form.where("paynum ilike ?", param_value)
          end
            
        end

  end # search end



  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
    if current_user.try(:role) == "agent"
      if current_user.paynum != @form.paynum and current_user.id != @form.user_id
        redirect_to root_url
      end
    end
    
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
      format.html { redirect_to forms_path }
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
