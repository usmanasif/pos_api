class ProductsCollection < BaseCollection
  def meta
    return { results: [{total: total_count}, JSON.parse(results.to_json) ]}
  end

  private

  def relation
    @relation ||= Product.all
  end

  def total_count
    results.count
  end

  def ensure_filters
    filter_producta_by_vendor_id
    filter_producta_by_customer_id

  end

  def filter_producta_by_vendor_id
  	filter {|relation| relation.where(vendor_id: params[:vendorID])} if params[:vendorID].present?
  end

  def filter_producta_by_customer_id
    filter {|relation| relation.where(customer_id: params[:customerID])} if params[:customerID].present?
  end
end