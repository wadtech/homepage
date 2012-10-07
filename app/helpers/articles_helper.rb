module ArticlesHelper
  def published_link_text(publishable)
    if publishable.published? 
      image_tag('published.png', :alt => "Click to Unpublish", :class => "btn") 
    else
      image_tag('unpublished.png', :alt => "Publish", :class => "btn")
    end
  end

  def list_tags(taggable)
    content_tag :p, taggable.tag_list.map { |tag| link_to tag, tag_path(tag)}.join(', ').html_safe unless taggable.tag_list.empty?
  end
end
