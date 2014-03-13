And(/^I have entered "(.*?)" payment amount$/) do |payment_amount|
  enter_text(@customer_app.payment.form.amount, payment_amount)
end

And(/^I have selected "(.*?)" as payment currency$/) do |arg1|
  @customer_app.payment.form.wait_for_drop_down
  @customer_app.payment.form.drop_down.click

  @customer_app.payment.drop_down_form.type_text.set arg1
  @customer_app.payment.drop_down_form.type_result.click

end

And(/^I have selected "(.*?)" beneficiary name$/) do |beneficiary_name|
  @customer_app.payment.form.beneficiary_drop_down.click
  @customer_app.payment.drop_down_form.type_text.set beneficiary_name
  @customer_app.payment.drop_down_form.type_result.click
end