class ContactsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:index, :show, :archive]

  SMTP_ERRORS = [
    Net::SMTPAuthenticationError,
    Net::SMTPServerBusy,
    Net::SMTPSyntaxError,
    Net::SMTPFatalError,
    Net::SMTPUnknownError
  ]

  # GET /articles
  # GET /articles.json
  def index
    if params[:archived]
      @contacts = Contact.all
    else
      @contacts = Contact.where(archived: false)
    end

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
        rescue *SMTP_ERRORS => e
          logger.error "[#{Time.now}] SMTP Error:\nCaught exception \"#{e}\"Trace:\n#{e.backtrace.join("\n")}"
        ensure
          format.html { redirect_to root_url, notice: 'Thank you for your email.' }
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  def archive
    @contact = Contact.find(params[:id])
    @contact.archive!

    respond_to do |format|
      format.html {
        if @contact.archived?
          flash[:notice] = "#{@contact.subject} archived."
        else
          flash[:notice] = "#{@contact.subject} restored."
        end
        redirect_to contacts_path
      }
      format.js {
        render :content_type => 'text/javascript'
      }
    end
  end
end
