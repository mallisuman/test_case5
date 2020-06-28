class Category < ApplicationRecord
	has_many :categories, foreign_key: :cid
end
