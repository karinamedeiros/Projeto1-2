class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index    
    @users = User.all
    @users = @users.starts_with(params[:starts_with]) if params[:starts_with].present?
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    puts 'oi'  
  end

  # POST /users/create
  def create
     puts 'oi 2'  
    @user = User.new(user_params)
    puts @user.email
    puts 'params = ' + params.to_s
    respond_to do |format|
      if @user.save
        format.html { redirect_to User, notice: 'Usuário criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: User}
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /users/1/edit
  # GET /users/1/edit.json
  def edit         
  end

  # POST /users
  # POST /users.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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
      format.json { head :no_content }
    end
  end

 private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :cpf, :phoneHome, :phoneMobile, :address, :email, :login, :password, :password_confirmation, :role)
    end

end
