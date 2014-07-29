class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      #params.require(:user).permit(:name, :cpf, :phoneHome, :phoneMobile, :address, :email, :login, :password)
    end
end
