class CategoriesController < ApplicationController
  before_action :find_id, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @page_title = 'Add New Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      set_flash :success, object: @category
      redirect_to categories_path
    else
      set_flash :error, object: @category
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @category.update(category_params)
      set_flash :success, object: @category
      redirect_to categories_path
    else
      set_flash :error, object: @category
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = @category.name + ' was deleted.'
      redirect_to categories_path
    end
  end

  private

  def find_id
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
