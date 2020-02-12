class ItemSizeCollection < BaseCollection
  def meta
    total_count
  end

  private

  def relation
    @relation ||= ItemSize.all
  end

  def total_count
    results.count
  end

  def ensure_filters; end
end
