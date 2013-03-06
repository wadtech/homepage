module WelcomeHelper
  def info_links
    pages = Page.all.sort
    links = Array.new

    linkto = {:link_text => "Home", :path => root_url}
    links << linkto
    pages.each do |page|
      linkto = {:link_text => page.permalink, :path => page_path(page.permalink)}
      links << linkto
    end unless pages.nil?

    linkto = {:link_text => "Projects", :path => projects_path}
    links << linkto
    linkto = {:link_text => "Contact", :path => new_contact_path}
    links << linkto
  end
end
