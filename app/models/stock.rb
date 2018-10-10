class Stock < ActiveRecord::Base
  
  
  def self.new_form_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.company_name, tiker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price) 
     rescue StandardError.Exception => e
     return nil
    end 
  end 
  
  def self.strip_commas(number)
    number.gsub(",", "")
  end
end

