class UsersController < ApplicationController

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user_save] = t'flash.user_save'
      session[:user_id] = @user.id
   
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to user_path(params[:id])
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,

                                  :password_confirmation)
  end

end
