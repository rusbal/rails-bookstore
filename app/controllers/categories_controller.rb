class CategoriesController < ApplicationController

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
      flash[:notice] = 'Category created'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = 'Category updated'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
