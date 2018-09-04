class Admin::CategoriesController < ApplicationController
  layout "admin"

  before_action :load_category, except: %i(index new create)

  def index
    @categories = Category.ordered_by_name.paginate page: params[:page],
      per_page: Settings.controller.admin.categories.per_page
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "controllers.admin.category.create.success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update category_params
      flash[:success] = t "controllers.admin.category.update.success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "controllers.admin.category.update.danger"
      redirect_to admin_categories_path
    end
  end

  def destroy
    if @category.try :destroy
      flash[:success] = t "controllers.admin.category.destroy.success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "controllers.admin.category.destroy.danger"
      redirect_to admin_categories_path
    end
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category.present?
    flash[:danger] = t "controllers.admin.category.load.danger"
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit :name
  end
end
