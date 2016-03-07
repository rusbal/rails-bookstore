class AuthorsController < ApplicationController
  before_action :find_id, only: [:edit, :update, :destroy]

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
      set_flash :success, object: @author
      redirect_to authors_path
    else
      set_flash :error, object: @author
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @author.update(author_params)
      set_flash :success, object: @author
      redirect_to authors_path
    else
      set_flash :error, object: @author
      render :new
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = @author.first_name + ' ' + @author.last_name + ' was deleted.'
      redirect_to authors_path
    end
  end

  private

  def find_id
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
