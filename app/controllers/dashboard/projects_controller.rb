module Dashboard
  class ProjectsController < ApplicationController
    def layout_by_resource
      "dashboard"
    end

    before_action :authenticate_admin!

    def edit
      @project = Project.find(params[:id])
    end

    def new
      @project = Project.new
      @highlight = Highlight.new
    end

    def create
      @project = Project.new(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to @project, notice: "Project successfully created."}
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @project = Project.find(params[:id])

      respond_to do |format|
        if @project.update_attributes(project_params)
          format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy

      respond_to do |format|
        format.html { redirect_to projects_url }
      end
    end

    def refresh
      @project = Project.find(params[:project_id])
      @project.fetch_from_github

      respond_to do |format|
        if @project.save
          format.html { redirect_to @project, notice: "Project metadata fetched from Github."}
        else
          format.html { redirect_to @project, error: "Could not refresh project metadata." }
        end
      end
    end

    private

    def project_params
      params.require(:project).permit(:title, :image, :github, :description, :summary, :source_repository, :highlights_attributes => [:code_snippet, :image, :description, :project, :title])
    end
  end
end
