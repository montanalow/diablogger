require File.expand_path "../layout", __FILE__

class Public::Start < Public::Layout
  def page_title
    super "Get started now!"
  end
  
  def render_content
    h1 "Create a Dialog"
    form :action => "/start", :method => "post" do
      label "subject"
      input :type => "text", :id => "headline", :name => "headline"
      textarea :id => "content", :name => "content"
      label "your email"
      input :type => "text", :name => "creator_email"
      label "challenge email"
      input :type => "text", :name => "challenge_email"
      input :type => "submit", :value => "done"
    end
  end
end