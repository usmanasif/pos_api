class InvoicesCollection < BaseCollection


  def meta
    return { total_count: total_count, total: total, invoices: results, total_pages: total_pages } if !params["by_product"].present?
    { total_count: total_count, products: results, total_pages: total_pages } if params["by_product"].present?
  end

  private

  def total_count
    results.count if !params["by_product"].present?
  end

  def total
    return results.offset(0).sum(:total) if !params["by_product"].present?
  end

  def total_pages
    results.total_pages if params["page"].present?
  end

  def relation
    @relation ||= Invoice.all
  end

  def ensure_filters
    today_filter
    date_filter
    product_filter
  end

  def today_filter
    filter {|relation| relation.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)} if params[:today].present?
  end

  def date_filter
    filter {|relation| relation.where("invoices.created_at BETWEEN ? AND ?",Date.parse(params[:from_date]).beginning_of_day,Date.parse(params[:to_date]).end_of_day)} if params[:from_date].present? && params[:to_date].present?
  end

  def product_filter
    filter {|relation| relation.joins(sold_items: :item).select('"items"."id", "items"."name", SUM("sold_items"."quantity") as "sold_quantity", SUM ("sold_items"."unit_price"*"sold_items"."quantity") as "total_sold_price"').group('"items"."id"')} if params[:by_product].present?
  end

end
