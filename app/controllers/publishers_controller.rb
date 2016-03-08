class PublishersController < ApplicationController
  before_action :find_id, only: [:edit, :update, :destroy]

  def index
    @publishers = Publisher.all
  end

  def new
    @page_title = 'Add New Publisher'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to publishers_path
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @publisher.update(publisher_params)
      redirect_to publishers_path
    else
      render :new
    end
  end

  def destroy
    if @publisher.destroy
      flash[:success] = @publisher.name + ' was deleted.'
      redirect_to publishers_path
    end
  end

  private

  def find_id
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
