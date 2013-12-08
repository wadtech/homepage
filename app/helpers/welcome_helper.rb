module WelcomeHelper
  def info_links
    pages = Page.all.sort
    links = Array.new

    links << { :link_text => "Blog", :path => root_url }
    links << { :link_text => "Projects", :path => projects_path }
    pages.each do |page|
      links << { :link_text => page.permalink.titleize, :path => page_path(page.permalink) }
    end unless pages.nil?

    links
  end
end
