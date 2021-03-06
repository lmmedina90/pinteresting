class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def delete_all
    User.delete_all

    respond_to do |format|
      format.html {redirect_to users_url}
      format.json {head :no_content}
    end
  end

  def index
    @users = User.all

    if @users.count > 5
      @some_text = "We have #{@users.count} users."
    else
      @some_text = "We need more users"
    end
  end

  def new_temp
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @boards = @user.boards

    if @user.first_name == "Kailey"
      @some_text = "Hey Kailey"
    else 
      @some_text = "You are not Kailey, but hello #{@user.first_name}"
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to "/boards/new", notice: 'Welcome to Pinteresting.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Deleted' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
