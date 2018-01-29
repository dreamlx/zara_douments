class Storage < ActiveRecord::Base
	validates :code, presence: true
	has_many :documents
end
