class Log < ActiveRecord::Base
	has_many :entries
	default_scope { order('created_at ASC') }
	belongs_to :user
end
