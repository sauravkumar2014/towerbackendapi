class Currencyinfo < ApplicationRecord
	has_many :currencyprice, :primary_key => 'symbol', :foreign_key => 'symbol', :class_name => 'Currencyprice'
end
