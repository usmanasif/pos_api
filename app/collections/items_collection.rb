class ItemsCollection < BaseCollection
  def meta
    return { data: results } if params[:stock_by_category].present?

    [ { total: total_count}, JSON.parse(results.to_json(include: {category: {only: [:name, :id]}})) ]
  end

  private

  def relation
    @relation ||= Item.all
  end
  def total_count
    results.count
  end

  def ensure_filters
    by_category_filter
    stock_by_category_filter
  end

  def by_category_filter
      filter {|relation| relation.where(category_id: Category.find(params[:category_id]).subtree_ids)} if params[:category_id].present?
  end

  def stock_by_category_filter
    filter {|relation| relation.joins(:category).group("categories.name").select("sum(items.current_stock) as total, categories.name")} if params[:stock_by_category].present?
  end

end
