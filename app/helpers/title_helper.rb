module TitleHelper
  #title helper - site name plus current controller or article/project parameter.
  def title_helper
    if params[:id].nil?
      extra = " - #{current_controller}"
    else
      extra = " - #{current_controller} - #{current_id}"
    end
    (ENV['ABOUT_SITE_TITLE'] || 'My Homepage') + extra
  end

  def current_controller
    current_controller = params[:controller]
    current_controller.gsub!('_',' ')
    current_controller.gsub!(/\b\w/) do
      $&.upcase
    end
  end

  def current_id
    current_id = params[:id]
    current_id.gsub!('-',' ')
    current_id.gsub!(/\d\s\w+\s/,'')
    current_id.gsub!(/\b\w/) do
      $&.upcase
    end
  end
end
