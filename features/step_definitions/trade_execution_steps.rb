When(/^I navigate to "(.*?)" page$/) do |page|

  case page
    when "convert"
      @customer_app.convert.load
    else
      raise "The given navigation #{page} page is not defined "
  end
  verify_tab(page)
end
When(/^I submit a quote$/) do
  @customer_app.convert.get_quote.click
end

When(/^I have entered "([^"]*)" currency as "([^"]*)"$/) do |currency_code, currency_side|

  sleep(1.to_i)
  case currency_side
    when "sell_currency"
      @customer_app.convert.wait_for_select_sell_currency
      @customer_app.convert.select_sell_currency.click
      @customer_app.convert.wait_for_type_sell_currency
      @customer_app.convert.type_sell_currency.set currency_code

      @customer_app.convert.wait_for_search_results
      @customer_app.convert.search_results.click

      @sell_currency =currency_code

    when "buy_currency"
      @customer_app.convert.wait_for_select_buy_currency
      @customer_app.convert.select_buy_currency.click
      @customer_app.convert.wait_for_type_sell_currency
      @customer_app.convert.type_sell_currency.set currency_code

      @customer_app.convert.wait_for_search_results
      @customer_app.convert.search_results.click

      @buy_currency =currency_code

  end
end

And(/I have entered "(.*?)" amount and "(.*?)"$/) do |amount, side|
  @side = side
  @trade_amount =amount.to_i
  if @side.downcase == 'sell'
    @customer_app.convert.quote.amount_dropdown.click
    @customer_app.convert.quote.wait_for_amount_dropdown_result
    select_from_list(@customer_app.convert.quote.amount_dropdown_result,@side)
  end
  @customer_app.convert.amount.set @trade_amount
end

And(/^I have quoted the trade$/) do
  @customer_app.convert.get_quote.click
end

When(/^I confirm the quote$/) do
  sleep(1.to_i)
  @customer_app.convert.trade_confirm.click
end

Then(/^the trade is booked successfully$/) do
  @customer_app.convert.trade_reference.text.should_not be_nil
  verify_message(@customer_app.convert.trade_success_message,"Conversion Successful!")

  @customer_app.convert.confirmation.sold_currency.text.should == @sell_currency
  @customer_app.convert.confirmation.brought_currency.text.should == @buy_currency

  if @side.downcase == 'buy'
    #puts "the Buy amount is #{@customer_app.convert.confirmation.brought_amount.text}"
    @customer_app.convert.confirmation.brought_amount.text.to_i == @trade_amount
  else
    #puts "the Sell amount is #{@customer_app.convert.confirmation.sold_amount.text}"
    @customer_app.convert.confirmation.sold_amount.text.to_i == @trade_amount
  end
end