class Product < ApplicationRecord
	belongs_to :user, foreign_key: :uid
	belongs_to :category, foreign_key: :cid, optional: true
end
