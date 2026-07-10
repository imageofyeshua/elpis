module Paginatable
  extend ActiveSupport::Concern

  PaginationMetadata = Data.define(
    :current_page, 
    :total_pages, 
    :per_page, 
    :total_count, 
    :first_page?, 
    :last_page?
  )

  def paginate(collection, per_page: 10)
    @current_page = [params[:page].to_i, 1].max
    @per_page = per_page
    
    total_count = collection.count
    @total_pages = (total_count.to_f / @per_page).ceil
    @total_pages = 1 if @total_pages.zero?

    @current_page = @total_pages if @current_page > @total_pages
    offset = (@current_page - 1) * @per_page

    # Instantiate the Data object
    metadata = PaginationMetadata.new(
      current_page: @current_page,
      total_pages: @total_pages,
      per_page: @per_page,
      total_count: total_count,
      first_page?: @current_page == 1,
      last_page?: @current_page == @total_pages
    )

    [metadata, collection.limit(@per_page).offset(offset)]
  end
end
