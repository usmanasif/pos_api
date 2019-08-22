class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  validates_uniqueness_of :name, if: Proc.new { |c| c.parent.present? && c.parent.children.pluck(:name).include?(c.name) }
  has_ancestry

  def self.json_tree(nodes)
    nodes.map do |node, sub_nodes|
      {:name => node.name, :id => node.id, :children => Category.json_tree(sub_nodes).compact}
    end
  end
end
