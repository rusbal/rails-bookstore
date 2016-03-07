class AuthorsController < ApplicationController

  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

end
