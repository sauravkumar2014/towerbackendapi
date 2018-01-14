class Currencyinfo < ApplicationRecord
	has_many :currencyprices, :primary_key => 'symbol', :foreign_key => 'symbol', :class_name => 'Currencyprice'
end
