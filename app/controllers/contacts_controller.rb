class ContactsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    @contacts = Contact.where(archived: false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  def show
    @message = Contact.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render json: @message }
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
        begin
          ContactMailer.contact(@contact.subject, @contact.content, @contact.source_ip).deliver
          format.html { redirect_to root_url, notice: 'Thank you for your email.' }
          format.json { render json: @contact, status: :created, location: root_url }
        rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
          format.html { redirect_to root_url, alert: 'An error has occurred while sending your email, but your message has been stored.' }
          format.json { render json: @contact, status: :failed, location: root_url }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    @contact = Contact.find(params[:id])
    @contact.archive!

    respond_to do |format|
      format.html { redirect_to contacts_path, notice: "#{@contact.subject} archived."}
    end
  end
end
