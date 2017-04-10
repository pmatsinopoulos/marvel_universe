require 'ostruct'

class Character < OpenStruct
  def self.all(page = 1)
    page = 1 if page.zero?
    limit = 20
    offset = (page - 1) * limit
    results = $marvel_api.characters(offset: offset, limit: limit)
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
