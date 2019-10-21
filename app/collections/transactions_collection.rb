class TransactionsCollection < BaseCollection
  def meta
    return { results: [ { total: total_count}, JSON.parse(results.to_json(include: {vendor: {only: [:name, :store_name]}})) ]}
  end

  private

  def relation
    @relation ||= Transaction.all
  end
  
  def total_count
    results.count
  end

  def ensure_filters
  end
end