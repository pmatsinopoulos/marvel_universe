class Pagination
  attr_reader :current_page,
              :end_index,
              :last_page,
              :next_page,
              :previous_page,
              :path,
              :search_term,
              :start_index,
              :total

  def initialize(current_page:,
                 end_index:,
                 last_page:,
                 next_page:,
                 previous_page:,
                 path:,
                 search_term:,
                 start_index:,
                 total:)
    @current_page = current_page
    @end_index = end_index
    @last_page = last_page
    @next_page = next_page
    @previous_page = previous_page
    @path = path
    @search_term = search_term
    @start_index = start_index
    @total = total
  end

  def self.build(result_set:, path:)
    new(
        current_page: result_set.current_page,
        end_index: result_set.end_index,
        last_page: result_set.last_page,
        next_page: result_set.next_page,
        previous_page: result_set.previous_page,
        path: path,
        search_term: result_set.search_term,
        start_index: result_set.start_index,
        total: result_set.total
    )
  end
end
