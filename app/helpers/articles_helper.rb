module ArticlesHelper
  def published_link_text(publishable)
    publishable.published? ? image_tag('published.png', :alt => "Click to Unpublish", :class => "btn") : image_tag('unpublished.png', :alt => "Publish", :class => "btn")
  end
end
