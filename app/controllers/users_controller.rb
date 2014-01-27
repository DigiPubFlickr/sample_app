class UsersController < ApplicationController
  #def new
  #end

  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :signed_in_user, only: [:edit, :update]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@user = User.find(params[:id])
    @user = User.find_by_id(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page]) if @user
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
  #def create
  #  #@user = User.new(user_params)
  #  @user = User.new(params[:user])
  #  respond_to do |format|
  #    if @user.save
  #      format.html { redirect_to @user, notice: 'User was successfully created.' }
  #      format.json { render action: 'show', status: :created, location: @user }
  #    else
  #      format.html { render action: 'new' }
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  #def update
  #  respond_to do |format|
  #    if @user.update(user_params)
  #      format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
      #render 'show'
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #@user.destroy
    #respond_to do |format|
    #  format.html { redirect_to users_url }
    #  format.json { head :no_content }
    #end
    user = User.find(params[:id])
    #User.find(params[:id]).destroy
    redirect_to users_url if current_user?(user)
    user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
    #  @user = User.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, 
          :password, :password_confirmation)
    end
    # Before actions
    #def signed_in_user
    #  redirect_to signin_url, notice: "Please sign in." unless signed_in?
    #end
    #def signed_in_user
    #  unless signed_in?
    #    store_location
    #    redirect_to signin_url, notice: "Please sign in."
    #  end
    #end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
      #redirect_to(root_path) unless current_user
    end
end
