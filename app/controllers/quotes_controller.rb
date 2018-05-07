class QuotesController < ApplicationController
  def index
    author = params[:author]
    content = params[:content]

# if content with content findings first. else look for author things

    if content
      @quotes = Quote.search_content(content)
      json_response(@quotes)
    else
      @quotes = Quote.search_author(author)
      json_response(@quotes)
    end

    # V prior to search things
    # @quotes = Quote.all
    # json_response(@quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find!(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: {
        message: "Your quote has been updated successfully."
      }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    render status: 200, json: {
      message: "Quote has been succesfully removed"
    }
  end

private
  def quote_params
    params.permit(:author, :content)
  end
end
