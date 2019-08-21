class InvoicesCollection < BaseCollection

  def meta
    { total_count: total_count, total: total, invoices: results, total_pages: total_pages }
  end
  private

  def total_count
    results.count
  end

  def total
    results.offset(0).sum(:total)
  end

  def total_pages
    results.total_pages
  end

  def relation
    @relation ||= Invoice.all
  end

  def ensure_filters
    today_filter
    date_filter
  end

  def today_filter
    filter {|relation| relation.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)} if params[:today].present?
  end

  def date_filter
    filter {|relation| relation.where("created_at BETWEEN ? AND ?",Date.parse(params[:from_date]).beginning_of_day,Date.parse(params[:to_date]).end_of_day)} if params[:from_date].present? && params[:to_date].present?

  end

end
