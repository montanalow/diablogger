class Public::NotFound < App::View
  def initialize *args
    super
    @status = 404
  end
  
  def content
    html do
      head do
        title "Not Found"
      end
      body do
        text "404 Not Found"
      end
    end
  end
end
