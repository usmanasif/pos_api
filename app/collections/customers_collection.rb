class CustomersCollection < BaseCollection
  def meta
    return { results: [{total: total_count}, JSON.parse(results.to_json)]}
  end

  private

  def relation
    @relation ||= Customer.all
  end
  
  def total_count
    results.count
  end

  def ensure_filters
  end
end