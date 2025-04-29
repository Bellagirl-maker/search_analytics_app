class SearchQueriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @top_queries = SearchQuery.group(:query_text).order('count_id DESC').limit(10).count(:id)
  end

  def create
    ip = request.remote_ip
    query_text = params[:query_text].to_s.strip
  
    return redirect_to root_path if query_text.blank?
  
    SearchQuery.create(ip_address: ip, query_text: query_text)
  
    redirect_to root_path(query: query_text)
  end
  
end
