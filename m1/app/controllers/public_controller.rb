class PublicController < ApplicationController
  layout 'public'
  
  def index
    @top_authors = Author.all :limit => 10
    @top_diablogs = Diablog.all :limit => 10
  end

end
