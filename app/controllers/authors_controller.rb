class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:notice] = 'New author saved'
      redirect_to authors_path
    else
      flash[:alert] = 'Not ready to process, please check...'
      render 'new'
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
