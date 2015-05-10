class Log < ActiveRecord::Base
	has_many :entries through :users
	belongs_to :user
end
