class City < ApplicationRecord
	has_many :documents
	validates :title, presence: true
end
