class DialogsController < ApplicationController
  def show
    @diablog = Diablog.get params[:id]
  end

  def create
    @diablog = Diablog.new :creator => request_user.author, :posts => [(Post.new :author => request_user.author)]
  end

  def create_submit
    @diablog = Diablog.new params[:diablog]
    if @diablog.save
      flash[:notice] = "woot"
      redirect_to root_url
    else
      flash.now[:error] = "oops"
      render :create
    end
  end

end