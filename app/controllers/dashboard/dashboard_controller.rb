module Dashboard
  class DashboardController < ApplicationController
    def layout_by_resource
      "dashboard"
    end

    before_action :authenticate_admin!

    # GET /dashboard
    def index
      respond_to :html
    end
  end
end
