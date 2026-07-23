# app/models/paginator.rb
class Paginator
  attr_reader :relation, :current_page, :per_page

  def initialize(relation, page: 1, per_page: 20)
    @relation = relation
    @current_page = [page.to_i, 1].max
    @per_page = per_page.to_i.positive? ? per_page.to_i : 20
  end

  # Returns the paginated records array/relation
  def records
    @records ||= relation.limit(per_page).offset(offset)
  end

  def offset
    (current_page - 1) * per_page
  end

  def total_count
    @total_count ||= begin
      count_result = relation.unscope(:limit, :offset, :order).count
      count_result.is_a?(Hash) ? count_result.size : count_result
    end
  end

  def total_pages
    return 1 if total_count.zero?

    (total_count.to_f / per_page).ceil
  end

  def first_page?
    current_page == 1
  end

  def last_page?
    current_page >= total_pages
  end

  def next_page
    last_page? ? nil : current_page + 1
  end

  def prev_page
    first_page? ? nil : current_page - 1
  end

  # Generates page numbers with windowing (e.g. [1, :gap, 4, 5, 6, :gap, 12])
  def page_range(window: 2)
    return [] if total_pages <= 1

    left = [current_page - window, 1].max
    right = [current_page + window, total_pages].min

    pages = []
    
    # Always include first page
    pages << 1
    pages << :gap if left > 2
    
    # Middle window
    ((left == 1 ? 2 : left)..(right == total_pages ? total_pages - 1 : right)).each do |page|
      pages << page
    end

    # Always include last page
    pages << :gap if right < total_pages - 1
    pages << total_pages if total_pages > 1

    pages.uniq
  end
end
