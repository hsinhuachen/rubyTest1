class Candidate < ApplicationRecord
	# 姓名必填
	validates :name, presence: true
end
