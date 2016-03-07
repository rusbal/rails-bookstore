class PublishersController < ApplicationController

  def new
    @page_title = 'Add New Publisher'
    @publisher = Publisher.new
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
