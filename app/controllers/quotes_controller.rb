class QuotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_profile!
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
      redirect_to :back, notice: "Zitat gelöscht."
    else
      render :show
    end
  end

  def show_pending
    @pending_quotes = Quote.pending_overview(current_user)
  end

  private

  def load_quotable
    klass = [Profile, Teacher].detect { |c| params["#{c.name.underscore}_id"]}
    @quotable = klass.friendly.find(params["#{klass.name.underscore}_id"]) || klass.find(params["#{klass.name.underscore}_id"]) if klass
  end
end