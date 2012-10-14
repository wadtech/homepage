module TitleHelper
  #title helper - site name plus current controller or article/project parameter.
  def title_helper
    if extra = params[:id].nil?
      extra = " - #{current_controller_title}"
    else
      extra = " - #{current_controller_title} - #{current_id_title}"
    end
    "Pete's Development Blog" + extra
  end

  def current_controller_title
    current_controller = params[:controller]
    current_controller.gsub!('_',' ')
    current_controller.gsub!(/\b\w/){$&.upcase}
  end

  def current_id_title
    current_id = params[:id]
    current_id.gsub!('-',' ')
    current_id.gsub!(/\d\s\w+\s/,'')
    current_id.gsub!(/\b\w/){$&.upcase}
  end
end