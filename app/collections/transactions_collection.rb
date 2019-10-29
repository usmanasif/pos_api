class TransactionsCollection < BaseCollection
  def meta
    return { results: [ { total: total_count}, JSON.parse(results.to_json(include: {vendor: {only: [:name, :store_name]}, customer: {only: [:name]} }))]}
  end

  private

  def relation
    @relation ||= Transaction.all
  end
  
  def total_count
    results.count
  end

  def ensure_filters
    filter_transactions_by_vendor_name
    filter_transactions_by_store_name
    filter_transactions_by_date
    filter_vendor_transactions
    filter_customer_transactions
    filter_transactions_by_account_type
  end

  

  def filter_transactions_by_account_type
    filter {|relation| relation.where(account_type: params[:account_type])} if params[:account_type].present?
  end

  def filter_customer_transactions
    filter{|relation| relation.where(customer_id: params[:customerID])} if params[:customerID].present?
  end

  def filter_vendor_transactions
    filter{|relation| relation.where(vendor_id: params[:vendorID])} if params[:vendorID].present?
  end

  def filter_transactions_by_vendor_name
    filter {|relation| relation.where(vendor_id: Vendor.find_by_name(params[:vendor]).id)} if params[:vendor].present?
  end

  def filter_transactions_by_store_name
    filter {|relation| relation.where(vendor_id: Vendor.find_by_store_name(params[:store]).id)} if params[:store].present?    
  end

  def filter_transactions_by_date
    filter {|relation| relation.where("transaction_date between (?) and (?)",Date.parse(params[:startDate]).beginning_of_day,Date.parse(params[:endDate]).end_of_day)} if params[:startDate].present? && params[:endDate].present?
  end
end