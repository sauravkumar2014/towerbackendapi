class CreateCurrencyinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :currencyinfos do |t|
      t.string :symbol
      t.string :currencyname
      t.float :latestPrice
      t.float :latesttxVolume
      t.float :latestmarketcap

      t.timestamps
    end
  end
end
