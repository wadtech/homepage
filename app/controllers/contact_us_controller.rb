class ContactUsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:index, :create, :new]

  # GET /articles
  # GET /articles.json
  def index
    @messages = ContactUs.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @message = ContactUs.new
    @message.source_ip = request.remote_ip

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @message = ContactUs.new(params[:message])

    respond_to do |format|
      if @message.save
        ContactMailer.contact_us(@message.subject, @message.contents).deliver
        format.html { redirect_to site_url, notice: 'Message successfully sent.' }
        format.json { render json: @message, status: :created, location: site_url }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
