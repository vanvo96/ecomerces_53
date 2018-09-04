class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :load_user, except: %i(index new create)

  def index
    @users = User.ordered_by_name.paginate page: params[:page],
      per_page: Settings.controller.admin.user.per_page
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controllers.admin.user.create.success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controllers.admin.user.update.success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "controllers.admin.user.update.danger"
      redirect_to admin_users_path
    end
  end

  def destroy
    if @user.try :destroy
      flash[:success] = t "controllers.admin.user.destroy.success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "controllers.admin.user.destroy.danger"
      redirect_to admin_users_path
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:danger] = t "controllers.admin.user.load.danger"
    redirect_to admin_users_path
  end

  def user_params
    params.require :user.permit :name, :email, :phone, :password,
      :password_confirmation, :role
  end
end
