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
    filter_customers_by_name
    filter_customers_by_mobile_number
  end

  def filter_customers_by_name
    filter {|relation| relation.where('name LIKE ?', '%' + params[:customer] + '%')} if params[:customer].present?
  end

  def filter_customers_by_mobile_number
    filter {|relation| relation.where('phone_number LIKE ?', '%' + params[:mobile] + '%')} if params[:mobile].present?
  end
end