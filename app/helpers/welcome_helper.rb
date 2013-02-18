module WelcomeHelper
  def info_links
    pages = Page.all.sort
    links = Array.new
    pages.each do |page|
      linkto = link_to page.permalink, page_path(page.permalink)
      links << linkto.html_safe
    end unless pages.nil?

    linkto = link_to "Projects", projects_path
    links << linkto.html_safe
    linkto = link_to "Contact", new_contact_path
    links << linkto.html_safe

    links = safe_join(links, " - ")
  end
end
