And(/^I have entered "(.*?)" payment amount$/) do |payment_amount|
  enter_text(@customer_app.payment.form.amount, payment_amount)
end

And(/^I have selected "(.*?)" as payment currency$/) do |arg1|
  @customer_app.payment.form.wait_for_drop_down
  @customer_app.payment.form.drop_down.click

  @customer_app.payment.drop_down_form.type_text.set arg1
  @customer_app.payment.drop_down_form.type_result.click
  sleep(5.to_i)
end