module ArticlesHelper
  def published_link_text(publishable)
    publishable.published? ? image_tag('published.png', :alt => "Click to Unpublish", :border => 0) : image_tag('unpublished.png', :alt => "Publish", :border => 0)
  end
end
