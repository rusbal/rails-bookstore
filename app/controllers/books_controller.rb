class BooksController < ApplicationController
  before_action :find_id, only: [:edit, :show, :update, :destroy]

  def index
    @books = Book.all
    @categories = Category.all
  end

  def new
    @page_title = 'Add Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @categories = Category.all
  end

  def edit
    render :new
  end

  def update
    if @book.update(book_params)
      redirect_to authors_path
    else
      render :new
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = @book.title + ' was deleted.'
      redirect_to books_path
    end
  end

  private

  def find_id
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :coverpath)
  end
end
