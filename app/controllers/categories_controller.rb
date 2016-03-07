class CategoriesController < ApplicationController

  def new
    @page_title = 'Add New Category'
    @category = Category.new
  end

end
