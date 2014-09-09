class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Hate to say it but this line is pretty dangerous. The program will not verify the form if its sending to the sign_me_in method only. 
  skip_before_filter :verify_authenticity_token, only: [:sign_em_in]
  



  # GET /users
  # GET /users.json

  def sign_em_in

    sent_params = params[:user]

    # Check if the user is already signed up looking up their unique pay number
    if User.find_by paynum: sent_params[:paynum]
        @user = User.find_by paynum: sent_params[:paynum]
        sign_in @user
    else
      
      @user = User.new(user_params)
      
      #If the user isn't able to save it means that eaither the paynumber is already in use or the form was filled out wrong.
      #This really isn't going to be a form, This will be a mini form link on the REO Intranet.
      if @user.save!
        sign_in @user
        
      else
        flash[:error] = "Unable to sign in first-time user. <br /><br />
        Pay Number is invalid or already in use <br />
        License ID is Invalid or already in use <br />".html_safe
      end

    end

  end

  def index
     @users = User.all

    # @users = User.where("username ilike ? OR paynum ilike ?", current_user.username, current_user.paynum) - cant remember why wrote did this...

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
          @users = User.all

          if param_key == "username"
           @users = User.where("username ilike ?", param_value)
          elsif param_key == "paynum"
             @users = User.where("paynum ilike ?", param_value)
          end

        end

        # if the admin is signed in then run certain search queries
        if current_user.try(:role) == "admin"
          @users = User.all

          if param_key == "username"
           @users = User.where("username ilike ?", param_value)
          elsif param_key == "paynum"
             @users = User.where("paynum ilike ?", param_value)
          end
            
        end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  def search

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end

    respond_to do |format|

      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'User could not be updated' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content };
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :paynum, :role, :office_number, :email, :password, :password_confirmation)
    end
end
