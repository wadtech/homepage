class WelcomeController < ApplicationController
  def index
    # get latest 5 articles in summary form

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end    
  end
end
