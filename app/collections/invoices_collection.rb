class InvoicesCollection < BaseCollection

  def meta
    { total_count: total_count, total: total, invoices: results }
  end
  private

  def total_count
    results.count
  end

  def total
    results.sum(:total)
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
    filter {|relation| relation.where(created_at: params[:from_date]..params[:to_date])} if params[:from_date].present? && params[:to_date].present?

  end

end
