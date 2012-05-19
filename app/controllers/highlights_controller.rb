# class HighlightsController < ApplicationController
#   def show
#     @highlight = Highlight.find(params[:id])
#   end

#   def edit
#     @highlight = Highlight.find(params[:id])
#   end

#   def new
#     @highlight = Highlight.new
#   end

#   def create
#     @highlight = Highlight.new(params[:highlight])

#     respond_to do |format|
#       if @highlight.save
#         format.html { redirect_to @highlight, notice: "Highlight successfully created."}
#       else
#         format.html { render action: "new" }
#       end
#     end
#   end

#   def update
#     @highlight = Highlight.find(params[:id])

#     respond_to do |format|
#       if @highlight.update_attributes(params[:highlight])
#         format.html { redirect_to @highlight, notice: 'Highlight was successfully updated.' }
#       else
#         format.html { render action: "edit" }
#       end
#     end
#   end

#   def destroy
#     @highlight = Highlight.find(params[:id])
#     @highlight.destroy

#     respond_to do |format|
#       format.html { redirect_to projects_url }
#     end
#   end
# end