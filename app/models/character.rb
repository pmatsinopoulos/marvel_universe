require 'ostruct'

class Character < OpenStruct

  def self.all(page = 1, search_term = nil)
    page = 1 if page.zero?
    limit = 20
    offset = (page - 1) * limit

    search_params = {offset: offset, limit: limit}
    if search_term.present?
      search_params.merge!({nameStartsWith: search_term})
    end
    results = $marvel_api.characters(search_params)

    offset = results['data']['offset']
    previous_page = offset > 0
    count = results['data']['count']
    total = results['data']['total']
    next_page = offset + count < total
    limit = results['data']['limit']
    current_page = offset / limit + 1

    ResultSet.new(
      characters: results['data']['results'].map {|result| new_from_result(result)},
      copyright: results['attributionHTML'],
      total: total,
      start_index: offset + 1,
      end_index: offset + count,
      previous_page: previous_page,
      search_term: search_term,
      next_page: next_page,
      current_page: current_page,
      limit: limit
    )
  end

  private

  def self.new_from_result(result)
    new(
        id: result['id'],
        name: result['name'],
        description: result['description'],
        thumbnail: "#{result['thumbnail']['path']}.#{result['thumbnail']['extension']}"
    )
  end
end
