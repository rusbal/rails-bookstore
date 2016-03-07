class PublishersController < ApplicationController

  def new
    @page_title = 'Add New Publisher'
    @publisher = Publisher.new
  end

end
