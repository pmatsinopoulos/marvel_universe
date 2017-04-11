class ResultSet
  attr_accessor :characters,
                :copyright,
                :current_page,
                :end_index,
                :last_page,
                :limit,
                :next_page,
                :previous_page,
                :search_term,
                :start_index,
                :total
  alias :previous_page? :previous_page
  alias :next_page? :next_page

  def initialize(characters:,
                 copyright:,
                 current_page:,
                 end_index:,
                 limit:,
                 next_page:,
                 previous_page:,
                 search_term:,
                 start_index:,
                 total:)
    @characters = characters
    @copyright = copyright
    @current_page = current_page
    @end_index = end_index
    @next_page = next_page
    @previous_page = previous_page
    @search_term = search_term
    @start_index = start_index
    @total = total
    @last_page = total % limit != 0 ? total / limit + 1 : total / limit
  end
end
