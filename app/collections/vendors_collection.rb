class VendorsCollection < BaseCollection
  def meta
    return { results: [{total: total_count}, JSON.parse(results.to_json) ]}
  end

  private

  def relation
    @relation ||= Vendor.all
  end
  
  def total_count
    results.count
  end

  def ensure_filters
    filter_vendors_by_name
    filter_vendors_by_store_name
    filter_vendors_by_mobile_number
  end

  def filter_vendors_by_name
    filter {|relation| relation.where('name LIKE ?', '%' + params[:vendor] + '%')} if params[:vendor].present?
  end

  def filter_vendors_by_store_name
    filter {|relation| relation.where('store_name LIKE ?', '%' + params[:store] + '%')} if params[:store].present?
  end

  def filter_vendors_by_mobile_number
    filter {|relation| relation.where('phone_number LIKE ?', '%' + params[:mobile] + '%')} if params[:mobile].present?
  end


end