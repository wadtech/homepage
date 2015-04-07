module Dashboard
  class DashboardController < ApplicationController
    def layout_by_resource
      "dashboard"
    end

    # GET /dashboard
    def index
      respond_to :html
    end
  end
end
