class Currencyprice < ApplicationRecord
	belongs_to :currencyinfo, :primary_key => 'symbol', :foreign_key => 'symbol', :class_name => 'Currencyinfo'
end
