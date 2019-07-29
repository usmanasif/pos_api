class Invoice < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :sold_items

	accepts_nested_attributes_for :sold_items
	# , reject_if: :reject_posts

  # def reject_posts(attributes)
  #   attributes['title'].blank?
  # end
end
