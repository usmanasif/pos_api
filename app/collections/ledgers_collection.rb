class LedgersCollection < BaseCollection
  def meta
    return JSON.parse(results.to_json)
  end

  private

  def relation
    @relation ||= Ledger.all
  end
end