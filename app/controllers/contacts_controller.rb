class ContactsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:index]

  # GET /articles
  # GET /articles.json
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @contact = Contact.new
    @contact.source_ip = request.remote_ip

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        ContactMailer.contact(@contact.subject, @contact.content, @contact.source_ip).deliver
        format.html { redirect_to root_url, notice: 'Thank you for your email.' }
        format.json { render json: @contact, status: :created, location: root_url }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
