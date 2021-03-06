class QuotesController < ApplicationController
  before_filter :authenticate_user!, except: [:update, :edit]
  before_filter :ensure_profile!, except: [:update, :edit]
  before_filter :load_quotable

  def new

  end

  def create
    authorize :quote, :create?

    quote = @quotable.quotes.create(text: params[:quote][:text], author: current_user)

    if quote.persisted?
      redirect_to @quotable
    else
      render :new
    end
  end

  def edit
    @quote = Quote.find(params[:id])

    #authorize @quote
  end

  def update
    @quote = Quote.find(params[:quote_id])
    return unless (session[:validation_token] && (@quote.quotable_type == "Profile" ? (@quote.quotable.access_tokens.any? {|token| token.token == session[:validation_token]}) : (@quote.quotable.profile.access_tokens.any? {|token| token.token == session[:validation_token]}) ) || @user.moderator?)
    if @quote.update(quote_params)
      if session[:comment_edit_redirect_to_validations]
        redirect_to validate_comments_path(session[:validation_token])
      else
        redirect_to @quote.quotable
      end
      #redirect_to (session[:comment_edit_redirect_to_validations] ? validate_comments_path(session[:validation_token]) : @quote.quotable)
    else
      render :edit, notice: "Fehler."
    end
  end

  def index
    @quotes = @quotable.quotes
  end

  def approve
    @quote = @quotable.quotes.find(params[:quote_id])
    authorize @quote

    @quote.approved = true
    @quote.save!

    redirect_to :back
  end

  def destroy
    @quote = @quotable.quotes.find(params[:id])
    authorize @quote

    if @quote.destroy
      redirect_to @quotable, notice: "Kommentar gelöscht."
    else
      render :show
    end
  end

  def show_pending
    @pending_quotes = Quote.pending_overview(current_user)

    if @pending_quotes.empty?
      redirect_to root_url, notice: "Es gibt keine weiteren Kommentare, die auf Freigaben warten."
    end
  end

  private

  def load_quotable
    klass = [Profile, Teacher].detect { |c| params["#{c.name.underscore}_id"]}
    @quotable = klass.friendly.find(params["#{klass.name.underscore}_id"]) || klass.find(params["#{klass.name.underscore}_id"]) if klass
  end

  def quote_params
    params.require(:quote).permit(:text)
  end
end
