class CreateCurrencyprices < ActiveRecord::Migration[5.1]
  def change
    create_table :currencyprices do |t|
      t.string :symbol
      t.date :date
      t.float :txVolume
      t.float :txCount
      t.float :marketcap
      t.float :price
      t.float :exchangeVolume
      t.float :generatedCoins
      t.float :fees

      t.timestamps
    end
  end
end
