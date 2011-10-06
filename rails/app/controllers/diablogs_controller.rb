class DiablogsController < ApplicationController
  def show
    @diablog = Diablog.get params[:id]
  end

  def create
    @diablog = Diablog.new
  end

  def create_submit
    @diablog = Diablog.new :subject => params[:subject], :posts => [(Post.new :body => params[:body])], :user => (User.new :email => params[:email])
    if @diablog.save
      flash[:notice] = "woot"
      redirect_to root_url
    else
      flash.now[:error] = "oops"
      render :create
    end
  end

end