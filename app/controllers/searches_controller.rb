class SearchesController < ApplicationController
  #@articles = Article.search params[:search], :include => :author, :match_mode => :boolean
  def index
    @search_results = Chemical.search params[:search], :match_mode => :boolean
  end
end
