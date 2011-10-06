class Public;end

require File.expand_path "../main_controller", __FILE__
require File.expand_path "../../views/public/index", __FILE__
require File.expand_path "../../views/public/start", __FILE__

class Public::Controller < Main::Controller
  get '/' => Public::Index
  get '/index' => Public::Index

  get '/start' => Public::Start
  post '/start' do
    @creator = current_user.author
    @creator.email = params[:creator_email] if @creator.email.blank?
    @dialog = Dialog.new :headline => params[:headline], :creator => @creator
    @post = @dialog.posts.new :content => params[:content], :author => @creator
    if @creator.valid? && @dialog.valid? && @post.valid? && @creator.save && @dialog.save && @post.save
      flash[:info] = "#{challenger_email} has been notified!"
      Public::Index
    else
      flash[:error] = "Oops, looks like there were problems with your dialog"
      Public::Start
    end
  end
end
